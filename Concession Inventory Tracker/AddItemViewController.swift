//
//  AddItemViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/14/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//TO:DO
//Done button to Keyobard?
import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var cntByCaseSwitch: UISwitch!
    @IBOutlet weak var caseQField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var item = Item(name1: "Blank" , caseQuan: 0, sup: 1000, ind: 1000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Add Item"
        caseQField.keyboardType = .numberPad
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func saveButtonTap(_ sender: Any) {
        let newItem = Item(name1: "", caseQuan: 0, cntByCase: true, sup: 0, ind: 0)
        if !(nameField.text?.isEmpty)!{
            let trimmedString = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            newItem.name = trimmedString
        }
        if let caseQInt = Int(caseQField.text!), !(caseQField.text?.isEmpty)!{
            newItem.caseQuantity = caseQInt
        }
        if cntByCaseSwitch.isOn{
            newItem.countByCase = true
        } else{
            newItem.countByCase = false
        }
        for week in DH.data{
            week.supplierArray[item.supplier].itemArray.append(newItem)
        }
        //DH.blankWeek.supplierArray[item.supplier].itemArray.append(newItem)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    


}
