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
    var notificationTrigger: RAM.NotificationTrigger!
    var stateController: StateController!
    var textInstructions:UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // PopUP
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    let pop = Popup()
                    self.view.addSubview(pop)
        }
        
        textInstructions = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        textInstructions.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY+250)
        textInstructions.textAlignment = .center
        textInstructions.text = "I'm a test label"
        self.view.addSubview(textInstructions)
        
        stateController = StateController()
        updateAnchor()
    }
    
    @IBAction func prevButton(_ sender: Any) {
        if stateController.step > 1 {
            stateController.step -= 1
        }
        print("\(stateController.step)")
        updateAnchor()
    }

    @IBAction func nextButton(_ sender: Any) {
        stateController.step += 1
        print("\(stateController.step)")
        updateAnchor()
    }
    
    func updateAnchor() -> Void {
        if stateController.step == 1 {
            //step 1, depress RAM levers
            arView.scene.anchors.removeAll()
            let anchor = try! RAM.loadRAM1()
            anchor.generateCollisionShapes(recursive: true)
            arView.scene.anchors.append(anchor)
            notificationTrigger = anchor.notifications.stepRAM2
            textInstructions.text = "Depress the white levers"
            
        }
        else if stateController.step == 2 {
            //step 2, insert RAM sticks
            notificationTrigger.post()
            textInstructions.text = "Place ram sticks in until click"
            
        }
}

class StateController {
    var step: Int = 1
////    var anchor:Experience.Box!
//
//    func updateAnchor(anchor) {
//        switch step {
//        case 1:
//
//        case 2:
//        default:
//            print("nah")
//        }
//    }
    
    

}
}
