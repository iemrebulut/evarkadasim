//
//  ilcelerTableViewCell.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 29.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

class ilcelerTableViewCell: UITableViewCell {

    @IBOutlet weak var ilceNameLabel: UILabel!
    
    private var model:ilcelerContent?

    func configure(with model: ilcelerContent){
        
        self.ilceNameLabel.text = model.adi ?? "Boş"
        
    }

}
