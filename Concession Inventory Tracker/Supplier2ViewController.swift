//
//  Supplier2ViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//TO:DO
//Rearange the order of Listsby dragging

import UIKit

class Supplier2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    let DH = DataHandler.standard
    let supInt = 1
    @IBOutlet weak var tblView2: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Food"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tblView2.reloadData()
    }
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DH.data[DH.selectedWeek].supplierArray[supInt].itemArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell1", for: indexPath)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let destination = segue.destination as? EditItemViewController{
                destination.item = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[(tblView2.indexPathForSelectedRow?.row)!]
            }
        } else if segue.identifier == "addItem"{
            if let destination = segue.destination as? AddItemViewController{
                destination.item = DH.data[DH.selectedWeek].supplierArray[supInt].itemArray[0]
        }
    }
    }
    
}
