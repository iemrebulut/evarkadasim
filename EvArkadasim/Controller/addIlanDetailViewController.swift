//
//  addIlanDetailViewController.swift
//  EvArkadasim
//
//  Created by İhsan Emre Bulut on 29.09.2019.
//  Copyright © 2019 İhsan Emre BULUT. All rights reserved.
//

import UIKit
import BEMCheckBox

class addIlanDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, BEMCheckBoxDelegate{
    
    @IBOutlet weak var buzdolabiCheckbox: BEMCheckBox!
    @IBOutlet weak var bulasikMakCheckbox: BEMCheckBox!
    @IBOutlet weak var camasirMakCheckbox: BEMCheckBox!
    @IBOutlet weak var firinCheckbox: BEMCheckBox!
    @IBOutlet weak var klimaCheckbox: BEMCheckBox!
    @IBOutlet weak var sacKurutmaMakCheckbox: BEMCheckBox!
    @IBOutlet weak var tvCheckbox: BEMCheckBox!
    
    @IBOutlet weak var kediCheckbox: BEMCheckBox!
    @IBOutlet weak var kopekCheckbox: BEMCheckBox!
    @IBOutlet weak var balikCheckbox: BEMCheckBox!
    @IBOutlet weak var kusCheckbox: BEMCheckBox!
    @IBOutlet weak var hamsterCheckbox: BEMCheckBox!
    @IBOutlet weak var tavsanCheckbox: BEMCheckBox!
    @IBOutlet weak var kaplumbagaCheckbox: BEMCheckBox!
    
    @IBOutlet weak var otobusCheckbox: BEMCheckBox!
    @IBOutlet weak var minibusCheckbox: BEMCheckBox!
    @IBOutlet weak var metroCheckbox: BEMCheckBox!
    @IBOutlet weak var tramvayCheckbox: BEMCheckBox!
    
    @IBOutlet weak var ilanBaslikField: UITextField!
    @IBOutlet weak var bulunduguKatField: UITextField!
    @IBOutlet weak var odaSayisiField: UITextField!
    @IBOutlet weak var banyoSayisiField: UITextField!
    
    private let bulunduguKatData = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    private let odaSayisiData = ["1+0","1+1","2+1","3+1","4+1","5+1"]
    private let banyoSayisiData = ["1","2","3","4","5"]
    
    
    private var itemSelected = ""
    
    private var icOzellikler = [String]()
    
    private var evcilHayvanlar = [String]()
    
    private var ulasimImkanlari = [String]()
    
    weak var pickerView: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buzdolabiCheckbox.delegate = self
        bulasikMakCheckbox.delegate = self
        camasirMakCheckbox.delegate = self
        firinCheckbox.delegate = self
        klimaCheckbox.delegate = self
        sacKurutmaMakCheckbox.delegate = self
        tvCheckbox.delegate = self
        
        kediCheckbox.delegate = self
        kopekCheckbox.delegate = self
        balikCheckbox.delegate = self
        kusCheckbox.delegate = self
        hamsterCheckbox.delegate = self
        tavsanCheckbox.delegate = self
        kaplumbagaCheckbox.delegate = self
        
        otobusCheckbox.delegate = self
        minibusCheckbox.delegate = self
        metroCheckbox.delegate = self
        tramvayCheckbox.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        bulunduguKatField.delegate = self
        odaSayisiField.delegate = self
        banyoSayisiField.delegate = self
        
        bulunduguKatField.inputView = pickerView
        odaSayisiField.inputView = pickerView
        banyoSayisiField.inputView = pickerView
        
        self.pickerView = pickerView
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox.tag == 1 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Buzdolabı")
        } else if checkBox.tag == 2 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Bulaşık Makinesi")
        } else if checkBox.tag == 3 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Çamaşır Makinesi")
        } else if checkBox.tag == 4 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Fırın")
        } else if checkBox.tag == 5 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Klima")
        } else if checkBox.tag == 6 {
            checkArray(arrayName: &icOzellikler, arrayVal: "Saç Kurutma Makinesi")
        } else if checkBox.tag == 7 {
            checkArray(arrayName: &icOzellikler, arrayVal: "TV")
        }
        
        else if checkBox.tag == 10 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Kedi")
        } else if checkBox.tag == 11 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Köpek")
        } else if checkBox.tag == 12 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Balık")
        } else if checkBox.tag == 13 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Kuş")
        } else if checkBox.tag == 14 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Hamster")
        } else if checkBox.tag == 15 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Tavşan")
        } else if checkBox.tag == 16 {
            checkArray(arrayName: &evcilHayvanlar, arrayVal: "Kaplumbağa")
        }
        
        else if checkBox.tag == 20 {
            checkArray(arrayName: &ulasimImkanlari, arrayVal: "Otobüs")
        } else if checkBox.tag == 21 {
            checkArray(arrayName: &ulasimImkanlari, arrayVal: "Minibüs")
        } else if checkBox.tag == 22 {
            checkArray(arrayName: &ulasimImkanlari, arrayVal: "Metro")
        } else if checkBox.tag == 23 {
            checkArray(arrayName: &ulasimImkanlari, arrayVal: "Tramvay")
        }
        
        print("İç Özellikler: ",icOzellikler)
        print("Evcil Hayvanlar:", evcilHayvanlar)
        print("Ulaşım İmkanları:", ulasimImkanlari)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView?.reloadAllComponents()
    }
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if bulunduguKatField.isFirstResponder{
            return bulunduguKatData.count
        } else if odaSayisiField.isFirstResponder{
            return odaSayisiData.count
        } else if banyoSayisiField.isFirstResponder{
            return banyoSayisiData.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if bulunduguKatField.isFirstResponder{
            return bulunduguKatData[row]
        } else if odaSayisiField.isFirstResponder{
            return odaSayisiData[row]
        } else if banyoSayisiField.isFirstResponder{
            return banyoSayisiData[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if bulunduguKatField.isFirstResponder{
            let itemSelected = bulunduguKatData[row]
            bulunduguKatField.text = itemSelected
        } else if odaSayisiField.isFirstResponder{
            let itemSelected = odaSayisiData[row]
            odaSayisiField.text = itemSelected
        } else if banyoSayisiField.isFirstResponder{
            let itemSelected = banyoSayisiData[row]
            banyoSayisiField.text = itemSelected
        }
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
