import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.title, ascending: true)],
        animation: .default
    ) private var dreams: FetchedResults<Dream>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // For showing the add/edit sheet
    @State private var showDreamSheet = false
    @State private var selectedDream: Dream? = nil
    
    // Card scaling: default is 1.0 (base size). You can adjust this with the slider.
    @State private var cardScale: CGFloat = 1.0
    private let baseCardWidth: CGFloat = 200  // Base width for a golden rectangle card.
    private let goldenRatio: CGFloat = 1.618  // Height = width * goldenRatio
    
    var body: some View {
        #if os(macOS)
        // macOS: A single-view layout with a header, grid, and slider.
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
        .sheet(isPresented: $showDreamSheet) {
            if let dream = selectedDream {
                DreamSheetView(dream: dream, isPresented: $showDreamSheet)
            }
        }.onAppear{
            forceCloudKitSync()
        }
        #else
        // iOS/iPadOS: Use NavigationStack with grid and slider below.
        NavigationStack {
            VStack {
                gridView
                zoomSlider
            }
            .navigationTitle("Vision Board")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { createNewDream() }) {
                        Label("Add Dream", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showDreamSheet) {
                if let dream = selectedDream {
                    DreamSheetView(dream: dream, isPresented: $showDreamSheet)
                }
            }
        }
        .onAppear{
        forceCloudKitSync()
    }
        #endif
    }
        
    
    // MARK: - Header for macOS
    private var headerView: some View {
        Text("Vision Board")
            .font(.largeTitle)
            .padding()
    }
    
    // MARK: - Grid View
    private var gridView: some View {
        GeometryReader { geo in
            ScrollView {
                let cardWidth = baseCardWidth * cardScale
                #if os(macOS)
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
                .padding()
                #else
                let columns = gridColumns(for: geo.size, cardWidth: cardWidth)
                LazyVGrid(columns: columns, spacing: 16) {
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
                .padding()
                #endif
            }
        }
    }
    
    // MARK: - Zoom Slider (common for all platforms)
    private var zoomSlider: some View {
        HStack {
            Text("Zoom")
                .padding(.horizontal)
            Slider(value: $cardScale, in: 0.5...2.0, step: 0.1)
                .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
    
    #if os(iOS)
    private func gridColumns(for size: CGSize, cardWidth: CGFloat) -> [GridItem] {
        // For iOS: if the width is narrow, use one column; otherwise two columns.
        if size.width < (cardWidth * 1.5) {
            return [GridItem(.flexible())]
        } else {
            return [GridItem(.flexible()), GridItem(.flexible())]
        }
    }
    #endif
    
    // MARK: - Actions
    private func createNewDream() {
        let newDream = Dream(context: viewContext)
        newDream.title = ""
        newDream.desc = ""
        selectedDream = newDream
        showDreamSheet = true
    }
    
    private func editDream(_ dream: Dream) {
        selectedDream = dream
        showDreamSheet = true
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
