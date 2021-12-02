//
//  ViewController.swift
//  PC Building
//
//  Created by Irene Lee on 2021-11-02.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var anchor:Experience.Box!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anchor = try! Experience.loadBox()
        anchor.generateCollisionShapes(recursive: true)
        
        arView.scene.anchors.append(anchor)
    }
    
    @IBAction func button(_ sender: Any) {
        anchor.notifications.fanStart.post()
    }
}
