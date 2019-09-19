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

class IlanlarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let ilanlar = try? jsonDecoder.decode([Ilanlar].self, from: myData)
        
        //dump(ilanlar?.first)
        //print(ilanlar?.count)
        
        let ilanlar = try? jsonDecoder.decode([ilanContent].self, from: myData)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ilanCell", for: indexPath)
        
        //cell.textLabel?.text = json[indexPath.row]["baslik"]
        
        return cell
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
