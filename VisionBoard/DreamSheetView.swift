import SwiftUI
import PhotosUI

#if os(macOS)
import AppKit
#endif

struct DreamSheetView: View {
    @ObservedObject var dream: Dream
    @Binding var isPresented: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // iOS: Photo picker state.
    @State private var showPhotoPicker = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    // macOS: Track drop target state.
    #if os(macOS)
    @State private var isTargeted = false
    #endif
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: Binding(
                    get: { dream.title ?? "" },
                    set: { dream.title = $0 }
                ))
                TextField("Description", text: Binding(
                    get: { dream.desc ?? "" },
                    set: { dream.desc = $0 }
                ), axis: .vertical)
                .frame(minHeight: 50)
            }
            
            Section(header: Text("Image")) {
                imageSection
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Cancel", role: .cancel) {
                        // Optionally, delete an unsaved dream if its title is empty.
                        if dream.isInserted && (dream.title ?? "").isEmpty {
                            viewContext.delete(dream)
                        }
                        isPresented = false
                    }
                    Button("Save") {
                        saveDream()
                        isPresented = false
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding()
        .frame(minWidth: 350, minHeight: 400)
        .background(sheetBackgroundColor)
    }
    
    // Cross‑platform background for the sheet.
    private var sheetBackgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(.secondarySystemGroupedBackground)
        #endif
    }
    
    @ViewBuilder
    private var imageSection: some View {
        #if os(macOS)
        ZStack {
            if let image = nsImageFromDream {
                Image(nsImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(8)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondary.opacity(0.2))
                    .frame(height: 150)
                    .overlay(Text("Drop image or Click to Browse")
                        .multilineTextAlignment(.center))
            }
        }
        .onTapGesture {
            pickImageMac()
        }
        .onDrop(of: ["public.file-url"], isTargeted: $isTargeted) { providers in
            loadImageFromDrop(providers)
            return true
        }
        #else
        VStack {
            if let uiImage = uiImageFromDream {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(8)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondary.opacity(0.2))
                    .frame(height: 150)
                    .overlay(Text("Tap to pick photo")
                        .multilineTextAlignment(.center))
            }
        }
        .onTapGesture { showPhotoPicker = true }
        .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images)
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    dream.imageData = data
                }
            }
        }
        #endif
    }
    
    // MARK: - Helpers for Image Conversion
    #if os(macOS)
    private var nsImageFromDream: NSImage? {
        guard let data = dream.imageData else { return nil }
        return NSImage(data: data)
    }
    #endif
    
    #if os(iOS)
    private var uiImageFromDream: UIImage? {
        guard let data = dream.imageData else { return nil }
        return UIImage(data: data)
    }
    #endif
    
    private func saveDream() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving dream: \(error)")
        }
    }
    
    #if os(macOS)
    private func pickImageMac() {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedContentTypes = [.image]
        if panel.runModal() == .OK, let url = panel.url {
            if let image = NSImage(contentsOf: url),
               let data = image.tiffRepresentation {
                dream.imageData = data
            }
        }
    }
    
    private func loadImageFromDrop(_ providers: [NSItemProvider]) {
        for provider in providers {
            provider.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (item, error) in
                guard let data = item as? Data,
                      let url = URL(dataRepresentation: data, relativeTo: nil),
                      let image = NSImage(contentsOf: url),
                      let imageData = image.tiffRepresentation
                else { return }
                DispatchQueue.main.async {
                    dream.imageData = imageData
                }
            }
        }
    }
    #endif
}
