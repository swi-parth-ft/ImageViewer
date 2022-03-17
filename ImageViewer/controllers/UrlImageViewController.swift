//
//  UrlImageViewController.swift
//  ImageViewer
//
//  Created by Parth Antala on 2022-03-15.
//

import UIKit
protocol MiddleProtocol {
    func controllerDidFinishWithNewPicture(p:image)
    func controllerDidCancel()
}
class UrlImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var delegate:MiddleProtocol?
    
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageURL: UITextField!
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let imageName = imageName.text{
            if let imageUrl = imageURL.text{
                if !imageName.isEmpty && !imageUrl.isEmpty{
                    let data = try? Data(contentsOf: URL(string: imageUrl)!)
                    var img = UIImage(data: data!)!
                    let newImage = image(a: imageName, b: img)
                    delegate?.controllerDidFinishWithNewPicture(p: newImage)
                    
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    

    @IBAction func CalcelButtonClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }

}
