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
        // перехватываем жесты нажатия на самолет и вызываем handleTap при нажатии
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        arView.addGestureRecognizer(tapGesture) // добавляем распознаватель жестов
        
        
        //let configuration = ARFaceTrackingConfiguration() // создаем конфигурацию для распознавания лиц, нужен телефон с TrueDepth-камерой
        //arView.session.run(configuration) // запускаем ARView с созданной конфигурацией
        // если пользователю поступил звонок или он свернул приложение - надо останавливать AR-сессию, т.к. она тратит много ресурсов
        
        
        // загружаем из 3d-файла FaceR объект
        //let faceAnchor = try! FaceR.loadScene()
        let basketAnchor = try! Basket.loadScene()
        
        // загружаем объект на сцену
        //arView.scene.anchors.append(faceAnchor)
        arView.scene.anchors.append(basketAnchor)
    }
    
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) { // обработчик нажатия
        // получаем ссылку на сцену
        let arView = self.view as! ARView
        //var nodeName: String! // имя нажимаемой ноды
        // проверяем что нода была нажата
        let p = gestureRecognize.location(in: arView) // нажатие было внутри сцены? получаем координаты x,y касания пальцем на двухмерном экране
        let hitResults = arView.hitTest(p) // результат нажатия, массив объектов. Если провести воображаемый луч от глаза пользователя через точку касания на экране вглубь сцены, в массив попадают по порядку все объекты через которые проходит луч вглубь сцены
        // проверяем что получился как минимум 1 объект
        if hitResults.count > 0 {
            // получаем первый нажатый объект, ближний к пользователю
            //let result = hitResults[0]
            let ballAnchor = try! Ball.load_Ball()
            arView.scene.anchors.append(ballAnchor)
            //ballAnchor.move(to: float4x4, relativeTo: Entity?, duration: 0.5)
        }
    }
}
