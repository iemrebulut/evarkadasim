//
//  IlanlarViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 19.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit

let myUrl = "http://www.emrebulut.com.tr/evarkadasim/ilanlar.php"
let url = URL(string: myUrl)!
let myData = try! Data(contentsOf: url)
var jsonDecoder = JSONDecoder()

class IlanlarViewController: UIViewController{
    
    var items = [ilanContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let ilanlar = try? jsonDecoder.decode([Ilanlar].self, from: myData)
        
        //dump(ilanlar?.first)
        //print(ilanlar?.count)
        
        let ilanlar = try? jsonDecoder.decode([ilanContent].self, from: myData)
        self.items = ilanlar!
        
        var baslikArray = [String]()
        var icerikArray = [String]()
        var imageArray = [String]()
        
        guard let ilanCollection = ilanlar else { return }
        
        for ilan in ilanCollection {
            
            guard let itemBaslik = ilan.baslik else { return }
            guard let itemIcerik = ilan.icerik else { return }
            guard let itemImage = ilan.foto else { return }
            
            baslikArray.append(itemBaslik)
            icerikArray.append(itemIcerik)
            imageArray.append(itemImage)
            
            //baslikArray.append(ilan.baslik ?? "Boş Başlık")
            //icerikArray.append(ilan.icerik ?? "Boş İçerik")
            //imageArray.append(ilan.foto ?? "http://www.emrebulut.com.tr/images/about-1.jpg")
            
            
            
        }
        
    }
    
}

extension IlanlarViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ilanCell") as? ilanlarTableViewCell else { return UITableViewCell() }
        
        let model = self.items[indexPath.row]
        
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
