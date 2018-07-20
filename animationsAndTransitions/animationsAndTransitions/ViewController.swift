//
//  ViewController.swift
//  animationsAndTransitions
//
//  Created by John Jeffrey Chung on 7/18/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var viewButton: RoundButton!
    
    @IBOutlet weak var albumViewer: UIImageView!
    
    var photoPicker = UIImagePickerController()
    
    let transition = CircularAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        photoPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pickPhoto(_ sender: Any) {
        photoPicker.sourceType = .photoLibrary
        photoPicker.allowsEditing = true
        present(photoPicker, animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! albumViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.beginningPoint = viewButton.center
        transition.circleColor = viewButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.beginningPoint = viewButton.center
        transition.circleColor = viewButton.backgroundColor!
        
        return transition
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            albumViewer.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

