//
//  ilanlarModel.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 19.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import Foundation

struct 	ilanContent:Codable {
    var baslik:String?
    var icerik:String?
    var foto:String?
}

struct cityContent:Codable {
    var id:String?
    var adi:String?
}

struct ilcelerContent:Codable {
    var id:String?
    var adi:String?
}
