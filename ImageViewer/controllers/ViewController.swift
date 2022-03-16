//
//  ViewController.swift
//  ImageViewer
//
//  Created by Parth Antala on 2022-03-15.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MiddleProtocol {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePicker: UIPickerView!
    var manager:imageManager = imageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        self.imagePicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       // return 5
        print(manager.getImageList().count)
        return manager.getImageList().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       // return "5"
        print(manager.getImageList()[row].imageName)
        return manager.getImageList()[row].imageName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let resImg =  self.manager.getImageList()[row].images
            DispatchQueue.main.async {
                
                self.imageView.image = resImg
            }
        }
    }
    
    func controllerDidFinishWithNewPicture(p: image) {
        manager.addNewImage(i: p)
        imagePicker.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let apvc = segue.destination as!OptionsViewController
        apvc.delegate = self
    }

}

