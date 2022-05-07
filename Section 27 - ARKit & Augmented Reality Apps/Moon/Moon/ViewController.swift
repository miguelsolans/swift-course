//
//  ViewController.swift
//  ARDicee
//
//  Created by Miguel Solans on 07/05/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    
        self.addMoon();
        self.addEarth();
        
        // 3D requires light
        sceneView.autoenablesDefaultLighting = true;
        
    }
    
    func addMoon() {
        let sphere = SCNSphere(radius: 0.2);
        
        let material = SCNMaterial();
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        sphere.materials = [material];
        
        let node = SCNNode();
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5);
        node.geometry = sphere;
        
        sceneView.scene.rootNode.addChildNode(node);
    }
    
    func addEarth() {
        let sphere = SCNSphere(radius: 0.5);
        
        let material = SCNMaterial();
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_earth_daymap.jpg");
        
        sphere.materials = [material];
        
        let node = SCNNode();
        node.position = SCNVector3(x: 1, y: 0.1, z: -0.9);
        node.geometry = sphere;
        
        sceneView.scene.rootNode.addChildNode(node);
    }
    
    func addCube() {
        // The units are in meters
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red;
        
        cube.materials = [material];
        
        let node = SCNNode();
        // Z: negative means forward
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = cube;
        
        sceneView.scene.rootNode.addChildNode(node);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if ARWorldTrackingConfiguration.isSupported {
            
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()

            // Run the view's session
            sceneView.session.run(configuration)
            
        } else {
            
            print("Your Device is Not Supported")
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
