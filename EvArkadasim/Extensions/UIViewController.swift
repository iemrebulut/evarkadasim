//
//  alertExtensions.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 18.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

extension UIViewController {
    func goToDestination(destinationName:String) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HomePageVC = storyboard.instantiateViewController(withIdentifier: destinationName)
        
        self.present(HomePageVC, animated: true, completion: nil)
        
    }
    
    
    func showAlert(title: String, message: String, actionOk: String?, actionCancel: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: actionCancel, style: .cancel, handler: nil)
        
        if actionOk != nil {
            let actionOk = UIAlertAction(title: actionOk, style: .default, handler: nil)
            alert.addAction(actionOk)
        }
        
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
}
