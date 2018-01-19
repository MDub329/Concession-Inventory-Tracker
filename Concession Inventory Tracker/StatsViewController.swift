//
//  StatsViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/13/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//To:DO
//Header is overlapping
//commit changes to order textview on cell
//Done button to Keyobard?

import UIKit

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    var supInt = 1000
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
        tblView.estimatedSectionHeaderHeight = 40.0
        // Set a header for the table view
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tblView.frame.width, height: 75))
        tblView.tableHeaderView = header
        // Do any additional setup after loading the view.
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
        tblView.reloadData()
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
            cell.prevSoldLbl.text = String(prevWeek.sold)//doesnt work
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let segmentedControl = UISegmentedControl(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
        if section == 0{
            segmentedControl.insertSegment(withTitle: "Drinks", at: 0, animated: false)
        } else if section == 1{
            segmentedControl.insertSegment(withTitle: "Food", at: 0, animated: false)
        } else{
            segmentedControl.insertSegment(withTitle: "Candy", at: 0, animated: false)
        }
        segmentedControl.insertSegment(withTitle: "Prev Sold", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Inv Q", at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: "Order", at: 3, animated: false)
        segmentedControl.insertSegment(withTitle: "Order Sug", at: 4, animated: false)
        v.addSubview(segmentedControl)
        return v
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        supInt = indexPath.section
        performSegue(withIdentifier: "displayItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayItemViewController{
            destination.item = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[(tblView.indexPathForSelectedRow?.row)!]
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
