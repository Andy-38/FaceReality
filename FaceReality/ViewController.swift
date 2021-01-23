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
        
        //let configuration = ARFaceTrackingConfiguration() // создаем конфигурацию для распознавания лиц, нужен телефон с TrueDepth-камерой
        //arView.session.run(configuration) // запускаем ARView с созданной конфигурацией
        // если пользователю поступил звонок или он свернул приложение - надо останавливать AR-сессию, т.к. она тратит много ресурсов
        
        
        // загружаем из 3d-файла FaceR объект
        //let faceAnchor = try! FaceR.loadScene()
        let basketAnchor = try! Basket.loadScene()
        let ballAnchot = try! Ball.load_Ball()
        
        // загружаем объект на сцену
        //arView.scene.anchors.append(faceAnchor)
        arView.scene.anchors.append(basketAnchor)
    }
}
