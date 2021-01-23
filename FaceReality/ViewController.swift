//
//  ViewController.swift
//  FaceReality
//
//  Created by Andy Dvoytsov on 23.01.2021.
//

import ARKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ARFaceTrackingConfiguration() // создаем конфигурацию для распознавания лиц, нужен телефон с TrueDepth-камерой
        arView.session.run(configuration) // запускаем ARView с созданной конфигурацией
        // если пользователю поступил звонок или он свернул приложение - надо останавливать AR-сессию, т.к. она тратит много ресурсов
        
        
        // загружаем из 3d-файла FaceReal объект
        let faceAnchor = try! FaceR.loadScene()
        
        // загружаем объект на сцену
        arView.scene.anchors.append(faceAnchor)
    }
}
