//
//  IlanlarViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 19.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit
import Alamofire

class IlanlarViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [ilanContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Alamofire.request("http://www.emrebulut.com.tr/evarkadasim/ilanlar.php")
            .responseJSON { response in
                guard let json = response.data else { return }
                let jsonDecoder = JSONDecoder()
                let ilanlar = try? jsonDecoder.decode([ilanContent].self, from: json)
                guard let ilanCollection = ilanlar else { return }
                self.items = ilanCollection
                self.tableView?.reloadData()
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
