//
//  imageViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 24.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit
import Alamofire

class imageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let myImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func uploadButton(_ sender: Any) {
        
        //Post URL
        let myUrl = "http://emrebulut.com.tr/evarkadasim/upload3.php"
        
        let name = "Emre"
        let age = "11"
        
        //Call Parameters
        let params: Parameters = ["name": name,"age": age]
        
        let headers = [
            "token" : "W2Y3TUYS0RR13T3WX2X4QPRZ4ZQVWPYQ",
            "Content-type": "multipart/form-data",
            "Content-Disposition" : "form-data"
        ]
        
        //Checking image place holder
        //let image = #imageLiteral(resourceName: "placeholder-image")
        guard let imageToUpload = self.myImageView.image else { return }
        
        print("İşlem Başlıyor")
        //Checking if image is not selected!!
        if imageToUpload == nil
        {
            print("Foto Gelmedi")
            //self.hideActivityIndicator()
            showAlert(title: "Error", message: "Make sure you choose an image!", actionOk: nil, actionCancel: "Tamam")
            
        } else {
            print("Foto Geldi")
            
            Alamofire.upload(multipartFormData:
                {
                    (multipartFormData) in
                    
                    multipartFormData.append(imageToUpload.jpegData(compressionQuality: 0.75)!, withName: "image", fileName: "emre.jpeg", mimeType: "image/jpeg")
                    for (key, value) in params
                    {
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
            }, to:myUrl, method: .post, headers: headers)
            { (result) in
                switch result {
                case .success(let upload,_,_ ):
                    upload.uploadProgress(closure: { (progress) in
                        //Print progress
                        //self.showActivityIndicator()
                        print(1)
                    })
                    upload.responseJSON
                        { response in
                            print(response.result)
                            if let result = response.result.value {
                                print(5)
                                //Calling response from API
                                let message = (result as AnyObject).value(forKey: "message") as! String
                                let status = (result as AnyObject).value(forKey: "status") as! String
                                
                                //Case Success
                                if status == "1" {
                                    
                                    //self.hideActivityIndicator()
                                    print("Your Results are ====> ",result)
                                    self.showAlert(title: "Data Upload", message: message, actionOk: nil, actionCancel: "Tamam")
                                    
                                    
                                    //self.myImageView.image = #imageLiteral(resourceName: "placeholder-image")
                                    print(2)
                                }else{
                                    print(3)
                                    //self.hideActivityIndicator()
                                    self.showAlert(title: "Error Uploading", message: message, actionOk: nil, actionCancel: "Tamam")
                                }
                            }
                            
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    break
                }
            }
        }
    }
            
            /*Alamofire.upload(multipartFormData:
                {
                    (multipartFormData) in
                    
                    multipartFormData.append(image.jpegData(compressionQuality: 0.75)!, withName: "image", fileName: self.generateBoundary(), mimeType: "image/jpeg")
                    for (key, value) in params
                    {
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
            }, to:url,headers:nil)
            { (result) in
                switch result {
                case .success(let upload,_,_):
                    upload.uploadProgress(closure: { (progress) in
                        self.showActivityIndicator()
                    })
                }
                
            }*/
    
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
