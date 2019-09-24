//
//  imageViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 24.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

class imageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let myImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func uploadButton(_ sender: Any) {
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        myImagePicker.allowsEditing = true
        myImagePicker.sourceType = .photoLibrary
        
        present(myImagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImageView.contentMode = .scaleAspectFit
            myImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
