//
//  citysViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 28.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit
import Alamofire

class citysViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [cityContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://www.emrebulut.com.tr/evarkadasim/city_json.php")
            .responseJSON { response in
                guard let json = response.data else { return }
              
                let jsonDecoder = JSONDecoder()
                let sehirler = try? jsonDecoder.decode([cityContent].self, from: json)
                guard let cityCollection = sehirler else { return }
                self.items = cityCollection
                self.tableView?.reloadData()
                
        }
    }
}


extension citysViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as? citysTableViewCell else { return UITableViewCell() }
        
        let model = self.items[indexPath.row]
        
        cell.configure(with: model)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let model = self.items[indexPath.row]
        let VC = ilcelerViewController(with: model)
        
        self.navigationController?.pushViewController(VC, animated: true)*/
        
        print(123)
        let VC = ilcelerViewController() 
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
