import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.title, ascending: true)],
        animation: .default
    ) private var dreams: FetchedResults<Dream>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Controls presentation of the add/edit sheet.
    @State private var showDreamSheet = false
    @State private var selectedDream: Dream? = nil
    
    var body: some View {
        #if os(macOS)
        // macOS: A single view without a sidebar.
        VStack {
            headerView
            gridView
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
        }
        #else
        // iOS/iPadOS: Use NavigationStack.
        NavigationStack {
            gridView
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
        #endif
    }
    
    // A header for macOS.
    private var headerView: some View {
        Text("Vision Board")
            .font(.largeTitle)
            .padding()
    }
    
    // The main grid of Dream cards.
    private var gridView: some View {
        GeometryReader { geo in
            ScrollView {
                #if os(macOS)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16) {
                    ForEach(dreams) { dream in
                        DreamCardView(dream: dream)
                            .frame(height: 220)
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
                // iOS: Choose one column (iPhone) or two columns (iPad) based on available width.
                let columns = gridColumns(for: geo.size)
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(dreams) { dream in
                        DreamCardView(dream: dream)
                            .aspectRatio(3/4, contentMode: .fit)
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
    
    #if os(iOS)
    private func gridColumns(for size: CGSize) -> [GridItem] {
        if size.width < 600 {
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
}
