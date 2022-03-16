//
//  LocalImageViewController.swift
//  ImageViewer
//
//  Created by Parth Antala on 2022-03-15.
//

import UIKit

class LocalImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imagePreview: UIImageView!
    var newImage: image!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var delegate:MiddleProtocol?

    @IBAction func SelectButtonClicked(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        c.allowsEditing = false
        c.delegate = self
        present(c, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
            print(fileUrl.lastPathComponent)
        if let i = info[.originalImage] as? UIImage{
        newImage = image(a: "Local Image", b: i)
            imagePreview.image = i
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        delegate?.controllerDidFinishWithNewPicture(p: newImage)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func CancelButtonClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }

}
