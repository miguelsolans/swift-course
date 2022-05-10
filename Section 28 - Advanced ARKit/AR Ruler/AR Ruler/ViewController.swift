//
//  ViewController.swift
//  AR Ruler
//
//  Created by Miguel Solans on 10/05/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var dotNodes = [SCNNode]();
    var textNode = SCNNode();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints];
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if self.dotNodes.count >= 2 {
            for dot in dotNodes {
                dot.removeFromParentNode();
            }
            
            self.dotNodes = [SCNNode]();
        }
        
        if let touchLocation = touches.first?.location(in: sceneView) {
            
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint);
            
            if let hitResult = hitTestResults.first {
                self.addDot(at: hitResult);
            }
            
        }
        
    }
    
    // MARK: - Helper Methods
    func addDot(at hitResult: ARHitTestResult) {
        
        
        let dotGeometry = SCNSphere(radius: 0.005);
        
        let material = SCNMaterial();
        material.diffuse.contents = UIColor.red;
        
        dotGeometry.materials = [material];
        
        let dotNode = SCNNode(geometry: dotGeometry);
        
        dotNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z);
        
        sceneView.scene.rootNode.addChildNode(dotNode);
        
        self.dotNodes.append(dotNode);
        
        if self.dotNodes.count >= 2 {
            self.calculate();
        }
        
    }
    
    func calculate() {
        let start = dotNodes[ 0 ];
        let end = dotNodes[ 1 ];
        
        print("Start: \(start.position)\nEnd: \(end.position)");
        
        let a = end.position.x - start.position.x;
        let b = end.position.y - start.position.y;
        let c = end.position.z - start.position.z;
        
        let distance = sqrt(pow(a, 2) + pow(b, 2) + pow(c, 2));
        
        print("Distance: \(abs(distance))");
        
        self.updateText(text: String(abs(distance)), atPosition: end.position)
        
    }
    
    func updateText(text: String, atPosition position: SCNVector3) {
        self.textNode.removeFromParentNode();
        
        let textGeometry = SCNText(string: text, extrusionDepth: 0.5);
        textGeometry.firstMaterial?.diffuse.contents = UIColor.systemIndigo;
        
        self.textNode = SCNNode(geometry: textGeometry);
        textNode.position = SCNVector3(position.x, position.y + 0.01, position.z);
        
        textNode.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
        
        sceneView.scene.rootNode.addChildNode(textNode);
    }
}
