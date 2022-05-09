//
//  ViewController.swift
//  ARDicee
//
//  Created by Miguel Solans on 09/05/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var diceArray = [SCNNode]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        self.becomeFirstResponder();
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal;
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: Dice Rendering Methods
    // Touched a SceneKit location, convert to real world location
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: self.sceneView);
            
            // Searches for real world objects or anchor that is the captured image - converting a point in 2D to 3D
            let results = self.sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent);
            
            
            if let hitResult = results.first {
                self.addDice(atLocation: hitResult);
            }
            
        }
        
    }
    
    func addDice(atLocation location: ARHitTestResult) {
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
            
            diceNode.position = SCNVector3(
                x: location.worldTransform.columns.3.x,
                // Raise in Y by half of the dice height
                y: location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                z: location.worldTransform.columns.3.z
            );
            
            sceneView.scene.rootNode.addChildNode(diceNode)
            
            self.diceArray.append(diceNode);
            
        }
    }
    
    // MARK: - Actions
    func rollDices() {
        
        if(!diceArray.isEmpty) {
            for dice in self.diceArray {
                roll(dice: dice);
            }
        }
        
    }
    
    @IBAction func rollButtonTapped(_ sender: Any) {
        self.rollDices();
    }
    
    @IBAction func removeDicesButtonTapped(_ sender: Any) {
        if(!diceArray.isEmpty) {
            for dice in self.diceArray {
                dice.removeFromParentNode();
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        self.rollDices();
    }
    
    
    
    
    func roll(dice: SCNNode) {
        // Upper bound is 4 , shifted by 1
        let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2);
        let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2);
        
        dice.runAction(
            SCNAction.rotateTo(
                x: CGFloat(randomX),
                y: 0,
                z: CGFloat(randomZ),
                duration: 0.5
            )
        )
    }
    
    
    // MARK: - ARSceneView Delegate Methods
    
    // Detected a horizontal surface and gives a width and height in order to place things
    // anchor: a real world position and orientation to place objects in AR Scene
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        
        node.addChildNode( self.createPlane(with: planeAnchor) )
        
    }
    
    // MARK: - Plane Rendering Methods
    func createPlane(with planeAnchor: ARPlaneAnchor) -> SCNNode {
        // ScenePlane: Allows to create a plane in SceneKit
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
        let planeNode = SCNNode();
        planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z);
        
        // Negative because we want to rotate it clockwise
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0);
        
        let gridMaterial = SCNMaterial();
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png");
        
        plane.materials = [gridMaterial];
        
        planeNode.geometry = plane;
        
        return planeNode;
        
    }
}
