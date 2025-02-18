import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.title, ascending: true)],
        animation: .default
    ) private var dreams: FetchedResults<Dream>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Using .sheet(item:) for both create and edit.
    @State private var selectedDream: Dream? = nil
    
    // For macOS and iPad: zoom slider scaling.
    @State private var cardScale: CGFloat = 1.0
    private let baseCardWidth: CGFloat = 200  // Base width for a golden rectangle card.
    private let goldenRatio: CGFloat = 1.618  // Height = width * goldenRatio
    
    // --- iOS Only: Toggle for single vs. two‑column layout (iPhone only) ---
    #if os(iOS)
    @State private var isSingleColumn: Bool = false
    #endif
    
    var body: some View {
        #if os(macOS)
        // MARK: macOS Version (restored to original)
        VStack {
            headerView
            gridView
            zoomSlider
        }
        .frame(minWidth: 600, minHeight: 400)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: { createNewDream() }) {
                    Label("Add Dream", systemImage: "plus")
                }
            }
        }
        .sheet(item: $selectedDream, onDismiss: { selectedDream = nil }) { dream in
            DreamSheetView(dream: dream)
        }
        .onAppear {
            forceCloudKitSync()
        }
        #else
        // MARK: iOS (iPhone/iPad) Version
        NavigationStack {
            VStack {
                gridView
                // For iPad, continue to show the zoom slider.
                if UIDevice.current.userInterfaceIdiom == .pad {
                    zoomSlider
                }
            }
            .navigationTitle("Vision Board")
            .toolbar {
                // "Add Dream" button on the right.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { createNewDream() }) {
                        Label("Add Dream", systemImage: "plus")
                    }
                }
                // --- iPhone Only: Layout toggle button on the left ---
                if UIDevice.current.userInterfaceIdiom == .phone {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: { isSingleColumn.toggle() }) {
                            // Icon toggles between a full‑screen “square” and a grid “square.grid.2x2”
                            Image(systemName: isSingleColumn ? "square.grid.2x2" : "square")
                        }
                    }
                }
            }
            .sheet(item: $selectedDream, onDismiss: { selectedDream = nil }) { dream in
                DreamSheetView(dream: dream)
            }
        }
        .onAppear {
            forceCloudKitSync()
        }
        #endif
    }
    
    // MARK: - Header (macOS only)
    private var headerView: some View {
        Text("Vision Board")
            .font(.largeTitle)
            .padding()
    }
    
    // MARK: - Grid View
    #if os(macOS)
    // macOS grid view: original behavior.
    private var gridView: some View {
        GeometryReader { geo in
            ScrollView {
                let cardWidth = baseCardWidth * cardScale
                LazyVGrid(columns: [GridItem(.adaptive(minimum: cardWidth), spacing: 16)], spacing: 16) {
                    ForEach(dreams) { dream in
                        DreamCardView(dream: dream, cardWidth: cardWidth)
                            .contextMenu {
                                Button("Edit") { editDream(dream) }
                                Button(role: .destructive) { deleteDream(dream) } label: {
                                    Text("Delete")
                                }
                            }
                    }
                }
                .padding()  // Uniform padding around the grid.
            }
        }
    }
    #else
    // iOS grid view: conditional layout for iPhone vs. iPad.
    private var gridView: some View {
        GeometryReader { geo in
            ScrollView {
                // Calculate effective card width:
                // For iPhone:
                //   • In single-column mode: card width is full available width minus 16pt padding each side.
                //   • In two‑column mode: two cards plus 16pt inter‑item spacing and 16pt padding on each side.
                let effectiveCardWidth: CGFloat = {
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        if isSingleColumn {
                            return geo.size.width - 32  // 16pt left + 16pt right.
                        } else {
                            // Available width: total width minus 16pt padding on left and right and 16pt spacing between columns.
                            return (geo.size.width - 16 * 3) / 2
                        }
                    } else {
                        return baseCardWidth * cardScale
                    }
                }()
                
                // Define grid columns:
                let columns: [GridItem] = {
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        return isSingleColumn
                            ? [GridItem(.flexible())]
                            : [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
                    } else {
                        // iPad: Use adaptive layout.
                        if geo.size.width < (effectiveCardWidth * 1.5) {
                            return [GridItem(.flexible(), spacing: 16)]
                        } else {
                            return [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
                        }
                    }
                }()
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(dreams) { dream in
                        DreamCardView(dream: dream, cardWidth: effectiveCardWidth)
                            .contextMenu {
                                Button("Edit") { editDream(dream) }
                                Button(role: .destructive) { deleteDream(dream) } label: {
                                    Text("Delete")
                                }
                            }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
        }
    }
    #endif
    
    // MARK: - Zoom Slider (used on macOS and iPad)
    private var zoomSlider: some View {
        HStack {
            Text("Zoom")
                .padding(.horizontal)
            Slider(value: $cardScale, in: 0.5...2.0, step: 0.1)
                .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
    
    // MARK: - Actions
    private func createNewDream() {
        let newDream = Dream(context: viewContext)
        newDream.title = ""
        newDream.desc = ""
        selectedDream = newDream  // Triggers sheet presentation.
    }
    
    private func editDream(_ dream: Dream) {
        selectedDream = dream  // Triggers sheet presentation.
    }
    
    private func deleteDream(_ dream: Dream) {
        withAnimation {
            viewContext.delete(dream)
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func forceCloudKitSync() {
        let taskContext = PersistenceController.shared.container.newBackgroundContext()
        taskContext.perform {
            do {
                try taskContext.setQueryGenerationFrom(.current)
                print("🔄 Forced CloudKit fetch")
            } catch {
                print("⚠️ Error forcing sync: \(error)")
            }
        }
    }
}

/*// MARK: - Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Assuming PersistenceController.preview is set up for SwiftUI previews.
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice("iPhone 14")
    }
}*/
