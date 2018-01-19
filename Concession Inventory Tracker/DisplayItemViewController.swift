//
//  DisplayItemViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/15/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import UIKit

class DisplayItemViewController: UIViewController{

    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caseQField: UITextField!
    @IBOutlet weak var invQField: UITextField!
    @IBOutlet weak var movedField: UITextField!
    @IBOutlet weak var orderField: UITextField!
    @IBOutlet weak var orderSugField: UITextField!
    @IBOutlet weak var soldField: UITextField!
    @IBOutlet weak var bufferField: UITextField!
    @IBOutlet weak var totalSoldField: UITextField!
    @IBOutlet weak var avgSoldField: UITextField!
    @IBOutlet weak var totalPurchField: UITextField!
    
    var item = Item(name1: "Blank" , caseQuan: 0, sup: 1000, ind: 1000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.isEnabled = false
        caseQField.isEnabled = false
        invQField.isEnabled = false
        movedField.isEnabled = false
        orderField.isEnabled = false
        orderSugField.isEnabled = false
        soldField.isEnabled = false
        bufferField.isEnabled = false
        totalSoldField.isEnabled = false
        avgSoldField.isEnabled = false
        totalPurchField.isEnabled = false
        
        nameField.text = item.name
        caseQField.text = String(item.caseQuantity)
        invQField.text = String(item.inventoryQuantity)
        movedField.text = String(item.moved)
        orderField.text = String(item.actualOrder)
        orderSugField.text = String(OrderSuggestion(sup: item.supplier, item: item.index))
        soldField.text = String(CalcSold(sup: item.supplier, item: item.index))
        bufferField.text = String(item.buffer)
        totalSoldField.text = String(TotalSold(sup: item.supplier, item: item.index))
        avgSoldField.text = String(AverageSoldPerWeek(sup: item.supplier, item: item.index))
        totalPurchField.text = String(TotalPurchased(sup: item.supplier, item: item.index))
        // Do any additional setup after loading the view.
    }

    

}
