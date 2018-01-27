//
//  StatsViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/13/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//To:DO
//Header is overlapping
//Done button to Keyobard?

import UIKit

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tblViewStats: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var navBStr = ""
        if DH.selectedWeek == 0{
            navBStr = "Starting Inventory"
        } else if DH.data[DH.selectedWeek].finInv == true{
            navBStr = "Final Inventory"
        } else{
            navBStr = "Week " + String(DH.selectedWeek)
        }
        navBar.title = navBStr
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var navBStr = ""
        if DH.selectedWeek == 0{
            navBStr = "Starting Inventory"
        } else if DH.data[DH.selectedWeek].finInv == true{
            navBStr = "Final Inventory"
        } else{
            navBStr = "Week " + String(DH.selectedWeek)
        }
        navBar.title = navBStr
        tblViewStats.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemCount = DH.data[DH.selectedWeek].supplierArray[section].itemArray.count
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statCell", for: indexPath) as! tableViewCell
        let loc = DH.data[DH.selectedWeek].supplierArray[indexPath.section].itemArray[indexPath.row]
        cell.itemPassed = loc
        cell.nameLbl.text = loc.name
        cell.orderSugLbl.text = String(loc.orderSugestion)
        cell.invQLbl.text = String(loc.inventoryQuantity)
        cell.orderField.keyboardType = .numberPad
        cell.orderField.text = String(loc.actualOrder)
        if DH.selectedWeek == 0{
            cell.prevSoldLbl.text = "N/A"
        } else{
            let prevWeek = DH.data[DH.selectedWeek-1].supplierArray[indexPath.section].itemArray[indexPath.row]
            cell.prevSoldLbl.text = String(prevWeek.sold)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat{
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {//Create headerView
        
        let view = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerView
        view.backgroundColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
        var str = ""
                if section == 0{
                    str = "Drinks"
                } else if section == 1{
                    str = "Food"
                }else if section == 2{
                    str = "Candy"
                } else{
                    str = "Misc"
                }
        view.nameLbl.text = str
        view.prevSoldLbl.text = "Prev Sold"
        view.invQLbl.text = "Inv Q"
        view.orderLbl.text = "Order"
        view.orderSugLbl.text = "Sug"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "displayItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditItemViewController{
            destination.item = DH.data[DH.selectedWeek].supplierArray[(tblViewStats.indexPathForSelectedRow?.section)!].itemArray[(tblViewStats.indexPathForSelectedRow?.row)!]
        }
    }
    
}

class tableViewCell: UITableViewCell, UITextFieldDelegate{
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var orderSugLbl: UILabel!
    @IBOutlet weak var prevSoldLbl: UILabel!
    @IBOutlet weak var invQLbl: UILabel!
    @IBOutlet weak var orderField: UITextField!
    var itemPassed: Item?
    
    override func awakeFromNib() {
        orderField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let order = orderField.text, let orderInt = Int(order){
            itemPassed?.actualOrder = orderInt
        }
    }
}

class headerView: UITableViewCell{
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var prevSoldLbl: UILabel!
    @IBOutlet weak var invQLbl: UILabel!
    @IBOutlet weak var orderLbl: UILabel!
    @IBOutlet weak var orderSugLbl: UILabel!
    
}
