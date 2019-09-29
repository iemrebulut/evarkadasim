//
//  ilcelerViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 28.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit
import Alamofire

class ilcelerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public var cityModel: cityContent!
    
    var items = [ilcelerContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let ilID = self.cityModel.id else { return }
        let params: Parameters = ["il_id": ilID]
        
        Alamofire.request("http://www.emrebulut.com.tr/evarkadasim/ilce_json.php", method: .post, parameters: params)
            .responseJSON { response in
                // Debug
                // print("Response", response.result.value)
                // print("Response", response.result)
                
                guard let json = response.data else { return }
                
                let jsonDecoder = JSONDecoder()
                let ilceler = try? jsonDecoder.decode([ilcelerContent].self, from: json)
                guard let ilceCollection = ilceler else { return }
                self.items = ilceCollection
                self.tableView?.reloadData()
                //print(self.items)
            }
    }
}

extension ilcelerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ilceCell") as? ilcelerTableViewCell else { return UITableViewCell() }
        
        let model = self.items[indexPath.row]
        
        cell.configure(with: model)
        
        return cell
        
    }
    
    
}
