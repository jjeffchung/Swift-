//
//  ViewController.swift
//  ARApp
//  An application which makes use of the ARKit released in 2017
//  Created by John Jeffrey Chung on 3/1/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView! //View which will display the camera and the object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self //Set the view's delegae
        
        let sphere = SCNSphere(radius:0.2)
        let sphere2 = SCNSphere(radius:0.1)
        
        let material = SCNMaterial()
        let material2 = SCNMaterial()
        
        material.diffuse.contents = UIImage(named:"art.scnassets/2k_venus_surface.jpg")
        material2.diffuse.contents = UIImage(named:"art.scnassets/2k_earth_daymap.jpg") //(Can use either material)
        
        
        sphere.materials = [material]
        sphere2.materials = [material2]
        
        let node = SCNNode()
        let node2 = SCNNode()
        
        node.position = SCNVector3(x: 0, y:0.1, z: -0.5)
        node2.position = SCNVector3(x: 0.2, y:0.2, z: -0.5)
        
        node.geometry = sphere
        node2.geometry = sphere2
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node2)
        
        sceneView.autoenablesDefaultLighting = true
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
