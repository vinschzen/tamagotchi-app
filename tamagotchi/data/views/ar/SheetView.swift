import SwiftUI

struct SheetView: View {
    @Binding var isPresented : Bool
    @State var modelName : String = "Rabbit.usdz"
    
    @State private var opacity: Double = 0.0
    @State private var isPhotoTaken = false
    @State private var photo:UIImage?

    var body: some View {
        ZStack() {
            
            ARViewContainer(modelName: $modelName, isPhotoTaken: $isPhotoTaken, photo: $photo)
                .ignoresSafeArea(edges: .all)
                .overlay(
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(opacity)
                    }
                )
            
            VStack {
                HStack(alignment: .top) {
                  Spacer()
                  Button {
                    isPresented.toggle()
                  } label: {
                    Image(systemName: "xmark.circle")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .background(.ultraThinMaterial)
                      .clipShape(Circle())
                      .padding(24)
                  }
                }

                Spacer()

                Button {
                  print("Taking picture...")
                    withAnimation {
                            opacity = 1
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                opacity = 0
                            }
                        }
                
                    isPhotoTaken.toggle()
                } label: {
                  Image(systemName: "camera")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                }
                .padding(.bottom, 40)
                
                if photo != nil {
                    ShareLink(item: photo!, preview: SharePreview("New Photo", image: photo!))
                }
                

            }
        }
    }
    
    func takeScreenshot() {
        withAnimation(.easeInOut(duration: 2)) {
          opacity = opacity == 0.0 ? 1.0 : 0.0
        }
    }
}

extension UIImage: Transferable {
    
    public static var transferRepresentation: some TransferRepresentation {
        
        DataRepresentation(exportedContentType: .png) { image in
            if let pngData = image.pngData() {
                return pngData
            } else {
                // Handle the case where UIImage could not be converted to png.
                throw ConversionError.failedToConvertToPNG
            }
        }
    }
    
    enum ConversionError: Error {
        case failedToConvertToPNG
    }
}
