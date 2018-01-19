//
//  EditItemViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/12/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//To:DO
//Done button to Keyobard?
import UIKit

class EditItemViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caseQField: UITextField!
    @IBOutlet weak var invQField: UITextField!
    @IBOutlet weak var moveField: UITextField!
    @IBOutlet weak var orderField: UITextField!
    @IBOutlet weak var orderSugField: UITextField!
    @IBOutlet weak var soldField: UITextField!
    @IBOutlet weak var bufferField: UITextField!
    @IBOutlet weak var totalSoldField: UITextField!
    @IBOutlet weak var avgSoldField: UITextField!
    @IBOutlet weak var totalPurchasedField: UITextField!
    @IBOutlet weak var specSold: UITextField!
    @IBOutlet weak var movedLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var orderSugLabel: UILabel!
    @IBOutlet weak var soldLabel: UILabel!
    @IBOutlet weak var bufferLabel: UILabel!
    @IBOutlet weak var totSoldLabel: UILabel!
    @IBOutlet weak var avgSoldLabel: UILabel!
    @IBOutlet weak var totPurchLabel: UILabel!
    
    
    var item = Item(name1: "Blank" , caseQuan: 0, sup: 1000, ind: 1000)
    override func viewDidLoad() {
        super.viewDidLoad()
        caseQField.keyboardType = .numberPad
        invQField.keyboardType = .numberPad
        moveField.keyboardType = .numberPad
        orderField.keyboardType = .numberPad
        bufferField.keyboardType = .numberPad
        orderSugField.isEnabled = false
        soldField.isEnabled = false
        totalSoldField.isEnabled = false
        avgSoldField.isEnabled = false
        totalPurchasedField.isEnabled = false
        specSold.isEnabled = false
        specSold.isHidden = true
        
        if DH.selectedWeek == 0{
            nameField.text = item.name
            caseQField.text = String(item.caseQuantity)
            invQField.text = String(item.inventoryQuantity)
            specSold.isHidden = false
            specSold.text = String(CalcSold(sup: item.supplier, item: item.index))
            movedLabel.text = "Sold"
            soldField.isHidden = true
            moveField.isHidden = true
            orderField.isHidden = true
            orderSugField.isHidden = true
            bufferField.isHidden = true
            totalSoldField.isHidden = true
            avgSoldField.isHidden = true
            totalPurchasedField.isHidden = true
            orderLabel.isHidden = true
            orderSugLabel.isHidden = true
            soldLabel.isHidden = true
            bufferLabel.isHidden = true
            totSoldLabel.isHidden = true
            avgSoldLabel.isHidden = true
            totPurchLabel.isHidden = true
            
            
        }else if DH.data[DH.selectedWeek].finInv == true{
            nameField.text = item.name
            caseQField.text = String(item.caseQuantity)
            invQField.text = String(item.inventoryQuantity)
            soldField.isHidden = true
            moveField.isHidden = true
            orderField.isHidden = true
            orderSugField.isHidden = true
            bufferField.isHidden = true
            totalSoldField.isHidden = true
            avgSoldField.isHidden = true
            totalPurchasedField.isHidden = true
            orderLabel.isHidden = true
            orderSugLabel.isHidden = true
            soldLabel.isHidden = true
            bufferLabel.isHidden = true
            totSoldLabel.isHidden = true
            avgSoldLabel.isHidden = true
            totPurchLabel.isHidden = true
            movedLabel.isHidden = true
        } else{
            movedLabel.text = "Moved"
            nameField.text = item.name
            caseQField.text = String(item.caseQuantity)
            invQField.text = String(item.inventoryQuantity)
            moveField.text = String(item.moved)
            orderField.text = String(item.actualOrder)
            orderSugField.text = String(OrderSuggestion(sup: item.supplier, item: item.index))
            soldField.text = String(CalcSold(sup: item.supplier, item: item.index))
            bufferField.text = String(item.buffer)
            totalSoldField.text = String(TotalSold(sup: item.supplier, item: item.index))
            avgSoldField.text = String(AverageSoldPerWeek(sup: item.supplier, item: item.index))
            totalPurchasedField.text = String(TotalPurchased(sup: item.supplier, item: item.index))
        }
        self.hideKeyboardWhenTappedAround()
        //set all fields to item that is passed in
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        saveData()
        //commit changes to the data and figure out how to add it to every week after
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var navBStr = ""
        if DH.selectedWeek == 0{
            navBStr = "Starting Inventory"
        } else if DH.data[DH.selectedWeek].finInv == true{
            navBStr = "Final Inventory"
        } else{
            navBStr = "Week " + String(DH.selectedWeek)
        }
        navBar.title = navBStr
    }
    
    func saveData(){
        if let name = nameField.text, !name.isEmpty {
            for week in DH.data{
                week.supplierArray[item.supplier].itemArray[item.index].name = nameField.text!
            }
            DH.blankWeek.supplierArray[item.supplier].itemArray[item.index].name = nameField.text!
        }
        if let text = caseQField.text, let caseQuan = Int(text), !text.isEmpty {
            //do something if it's not empty
            for week in DH.data{
                week.supplierArray[item.supplier].itemArray[item.index].caseQuantity = caseQuan
            }
            DH.blankWeek.supplierArray[item.supplier].itemArray[item.index].caseQuantity = caseQuan
        }
        if !(invQField.text?.isEmpty)!{
            item.inventoryQuantity = Int(invQField.text!)!
        }else{
            item.inventoryQuantity = 50000
        }
        if !(specSold.text!.isEmpty){
            item.sold = Int(specSold.text!)!
        }
        
        
    }
}
