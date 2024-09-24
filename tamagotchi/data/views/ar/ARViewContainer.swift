import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer : UIViewRepresentable {
    typealias UIViewType = ARView
    
    @Binding var modelName: String
    @Binding var isPhotoTaken: Bool
    @Binding var photo: UIImage?
        
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        context.coordinator.view = arView
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleDoubleTap))
        doubleTapRecognizer.numberOfTapsRequired = 2
        arView.addGestureRecognizer(doubleTapRecognizer)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal,.vertical]
        config.environmentTexturing = .automatic
        config.frameSemantics.insert(.personSegmentationWithDepth)

        arView.session.run(config)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let anchorEntity = AnchorEntity(plane: .any)
        
        guard let modelEntity = try? Entity.loadModel(named: modelName) else {
            print("cannot find file")
            return }
        
        if (isPhotoTaken) {
            context.coordinator.view?.snapshot(saveToHDR: false) { (image) in
                let compressedImage = UIImage(
                    data: (image?.pngData())!)
//                UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
                photo = compressedImage!
            }
            isPhotoTaken = false
        }
            
        anchorEntity.addChild(modelEntity)
        if (uiView.scene.anchors.isEmpty) {
            uiView.scene.addAnchor(anchorEntity)
        }
        
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

class Coordinator: NSObject {
    
    weak var view: ARView?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        print("Location :", tapLocation)
        
        if let entity = view.entity(at: tapLocation) as? ModelEntity {
            print("Pressed !")
        } else {
            print("Entity at : ", view.entity)
        }
    }
    
    @objc func handleDoubleTap(_ recognizer: UITapGestureRecognizer) {
//            guard let view = self.view else { return }
//            
//            view.snapshot(saveToHDR: false) { (image) in
//                let compressedImage = UIImage(
//                    data: (image?.pngData())!)
//            UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
//        }
    }
    
}


extension Entity {
  func randomScale() {
    var newTransform = self.transform
    newTransform.scale = .init(
      repeating: Float.random(in: 0.5...1.5)
    )
    self.transform = newTransform
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
