//
//  ViewController.swift
//  FaceReality
//
//  Created by Andy Dvoytsov on 23.01.2021.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // загружаем из 3d-файла FaceReal объект
        let faceAnchor = try! FaceR.loadСцена()
        
        
        // загружаем объект на сцеун
        arView.scene.anchors.append(faceAnchor)
    }
}
