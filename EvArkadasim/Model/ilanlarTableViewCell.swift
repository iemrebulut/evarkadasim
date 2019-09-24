//
//  ilanlarTableViewCell.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 23.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

class ilanlarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ilanImageView: UIImageView!
    
    @IBOutlet private weak var baslikLabel: UILabel!
    
    @IBOutlet private weak var icerikLabel: UILabel!
    
    private var model: ilanContent?
     
     /*override func awakeFromNib() {
        self.ilanImageView.image = UIImage(named: "filli")
     }*/
     
     func configure(with model: ilanContent) {
        let imageUrlString = model.foto
        let imageUrl = URL(string: imageUrlString ?? "http://www.emrebulut.com.tr/images/about-1.jpg")
        let imageData = try! Data(contentsOf: imageUrl!)
        
        self.ilanImageView.image = UIImage(data: imageData)
        
        self.baslikLabel.text = model.baslik ?? "Boş"
        self.icerikLabel.text = model.icerik ?? "Boş"
        
        
        
     }
    
}
