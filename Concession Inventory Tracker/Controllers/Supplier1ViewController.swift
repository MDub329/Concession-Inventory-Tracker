//
//  Supplier1ViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//TO:DO
//Rearange the order of Listsby dragging

import UIKit

class Supplier1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var tblView: UITableView!
    var catTitle = "Drinks"
    var supPhoneNum = ""
    var supOrderNum = ""
    let DH = DataHandler.standard
    let supInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setStrings()
        tblView.reloadData()
    }
    
    @IBAction func changeInfoButton(_ sender: Any) {
        let alert = UIAlertController(title: "Info", message: "Edit Category Title, PhoneNum and Order Number", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = self.catTitle
        }
        
        alert.addTextField { (textField) in
            textField.text = self.supPhoneNum
        }
        alert.addTextField { (textField) in
            textField.text = self.supOrderNum
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let textField0 = alert?.textFields![0], let textFieldTxt0 = textField0.text {
                self.catTitle = textFieldTxt0
            }
            if let textField1 = alert?.textFields![1], let textFieldTxt1 = textField1.text{
                self.supPhoneNum = textFieldTxt1
            }
            if let textField2 = alert?.textFields![2], let textFieldTxt2 = textField2.text{
                self.supOrderNum = textFieldTxt2
            }
            self.saveStrings()
            self.setStrings()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DH.data[DH.selectedWeek].supplierArray[supInt].itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to Delete?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                for week in self.DH.data{
                    week.supplierArray[self.supInt].itemArray.remove(at: indexPath.row)
                }
                //self.DH.blankWeek.supplierArray[self.supInt].itemArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//
//    }
//    
//
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
    
    
    @IBAction func addButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let destination = segue.destination as? EditItemViewController{
                destination.item = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[(tblView.indexPathForSelectedRow?.row)!]
            }
        } else if segue.identifier == "addItem"{
            if let destination = segue.destination as? AddItemViewController{
                destination.item = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[0]
            }
        }
    }
    
    
    func saveStrings() {
        UserDefaults.standard.set(self.catTitle, forKey: "CatTitle")
        UserDefaults.standard.set(self.supPhoneNum, forKey: "PhoneTitle")
        UserDefaults.standard.set(self.supOrderNum, forKey: "OrderTitle")
    }
    
    func setStrings(){
        if let cTitle = UserDefaults.standard.string(forKey: "CatTitle"){
            catTitle = cTitle
        }
        if let pTitle = UserDefaults.standard.string(forKey: "PhoneTitle"){
            supPhoneNum = pTitle
        }
        if let oTitle = UserDefaults.standard.string(forKey: "OrderTitle"){
            supOrderNum = oTitle
        }
        
        navigationController?.tabBarItem.title = self.catTitle
        navBar.title = self.catTitle
    }
    
}
