//
//  OptionsViewController.swift
//  ImageViewer
//
//  Created by Parth Antala on 2022-03-15.
//

import UIKit

class OptionsViewController: UIViewController, MiddleProtocol {
    var delegate:MiddleProtocol?
  
    

 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func controllerDidFinishWithNewPicture(p: image) {
        delegate?.controllerDidFinishWithNewPicture(p: p)
        dismiss(animated: true, completion: nil)
    }

    func controllerDidCancel() {
        
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "url"){
        let apvc = segue.destination as!UrlImageViewController
        apvc.delegate = self
         
        }
        if(segue.identifier == "local"){
        let apvc = segue.destination as!LocalImageViewController
        apvc.delegate = self
        }
        
    }
}
