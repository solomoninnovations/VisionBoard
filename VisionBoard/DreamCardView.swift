import SwiftUI

struct DreamCardView: View {
    @ObservedObject var dream: Dream
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            if !isFlipped {
                frontView
            } else {
                backView
            }
        }
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 2, y: 2)
        .onTapGesture {
            withAnimation(.spring()) { isFlipped.toggle() }
        }
        #if os(iOS)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        #else
        .cornerRadius(12)
        #endif
    }
    
    // The front of the card shows the image and title.
    private var frontView: some View {
        ZStack(alignment: .bottomLeading) {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                           startPoint: .center,
                           endPoint: .bottom)
            Text(dream.title ?? "Untitled")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
        }
    }
    
    // The back shows the description.
    private var backView: some View {
        ZStack {
            platformBackgroundColor
            Text(dream.desc ?? "No Description")
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
    
    // Loads the image from Dream data.
    private var backgroundImage: Image {
        #if os(macOS)
        if let data = dream.imageData, let nsImage = NSImage(data: data) {
            return Image(nsImage: nsImage)
        }
        #else
        if let data = dream.imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        #endif
        return Image(systemName: "photo")
    }
    
    // A cross‑platform background color for the back of the card.
    private var platformBackgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(.secondarySystemBackground)
        #endif
    }
    
    #if os(iOS)
    private func isPhoneNarrow() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    #endif
}
