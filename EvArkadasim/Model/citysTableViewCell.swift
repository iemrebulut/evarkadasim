//
//  citysTableViewCell.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 28.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

class citysTableViewCell: UITableViewCell {

   /* override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }*/

    @IBOutlet weak var cityNameLabel: UILabel!
    
    private var model: cityContent?
    
    func configure(with model: cityContent) {
        
        
        self.cityNameLabel.text = model.adi ?? "Boş"
        
        
        
    }

}
