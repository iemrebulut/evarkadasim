//
//  LoginViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 19.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        let params = "email=" + email + "&password=" + password
        
        let urlString = "https://www.emrebulut.com.tr/evarkadasim/login.php"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("Error:", error)
            }
            else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let jsonParse = json {
                        var message:String!
                        var status:String!
                        
                        message = jsonParse["message"] as? String
                        status = jsonParse["status"] as? String
                        
                        if status == "Success"  {
                            DispatchQueue.main.async {
                                self.goToDestination(destinationName: "ilanPage")
                            }
                        }
                        else{
                            DispatchQueue.main.async {
                                self.showAlert(title: status, message: message, actionOk: nil, actionCancel: "Tamam")
                            }
                        }
                    }
                }
                catch {
                    print("Error")
                }
            }
            
        }
        task.resume()
        
    }
    

}
