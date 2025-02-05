import SwiftUI
#if os(macOS)
import AppKit
#endif

struct DreamCardView: View {
    @ObservedObject var dream: Dream
    let cardWidth: CGFloat
    private let goldenRatio: CGFloat = 1.618  // height = width * 1.618
    
    // Local state for the flip animation
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            if !isFlipped {
                frontView
            } else {
                backView
            }
        }
        .frame(width: cardWidth, height: cardWidth * goldenRatio)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 2, y: 2)
        .onTapGesture {
            withAnimation(.spring()) {
                isFlipped.toggle()
            }
        }
    }
    
    // Front view: the image with the title overlaid.
    private var frontView: some View {
        ZStack(alignment: .bottomLeading) {
            backgroundImage
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardWidth * goldenRatio)
                .clipped()
            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                           startPoint: .center,
                           endPoint: .bottom)
            Text(dream.title ?? "Untitled")
                .font(.headline)
                .foregroundColor(.white)
                .padding(8)
        }
    }
    
    // Back view: shows the description.
    private var backView: some View {
        ZStack {
            platformBackgroundColor
            Text(dream.desc ?? "No Description")
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(8)
        }
        .frame(width: cardWidth, height: cardWidth * goldenRatio)
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
    
    // Cross-platform background color.
    private var platformBackgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(.secondarySystemBackground)
        #endif
    }
}
