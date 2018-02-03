//
//  WeekViewController.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//
//TO:DO
//Multiple Stands?
//Fix blank Week
import UIKit
import os.log
class WeekViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var pickView: UIPickerView!
    var pvDataSource = ["Starting Inventory", "Week 1"]
    let DH = DataHandler.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBarButton()
        pickView.delegate = self
        pickView.dataSource = self
        DH.data.append(Week())
        DH.data.append(Week())
        navBar.title = settingsLauncher.standArray[DH.selectedStand]
    }
    
    @IBAction func addWeekButtonTap(_ sender: Any) {
        let dataCount = DH.data.count
        if DH.data[dataCount-1].finInv == false{
            //let newWeekj = 
            let newWeek = Week()
            DH.data.append(newWeek)
            let str = String(dataCount)
            pvDataSource.append("Week " + str )
            pickView.delegate = self
            pickView.dataSource = self
        } else{
            let alert = UIAlertController(title: "Error", message: "Final Inventory already selected", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func finInvButtonTap(_ sender: Any) {
        let dataCount = DH.data.count
        if DH.data[dataCount-1].finInv == false{
            //let newWeek = DH.blankWeek
            let newWeek = Week()
            DH.data.append(newWeek)
            DH.data[dataCount].finInv = true
            pvDataSource.append("Final Inventory" )
            pickView.delegate = self
            pickView.dataSource = self
        } else{
            let alert = UIAlertController(title: "Error", message: "Final Inventory already selected", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func undoAddWeelButtonTap(_ sender: Any) {
        let dataCountIndex = DH.data.count - 1
        if dataCountIndex == 1{
            let alert = UIAlertController(title: "Error", message: "Can not remove Week 1", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            DH.data[dataCountIndex].finInv = false
            pvDataSource.remove(at: dataCountIndex )
            DH.data.remove(at: dataCountIndex)
            let DC = dataCountIndex - 1
            pickView.selectRow(DC, inComponent: 0, animated: false)
            DH.selectedWeek = DC
            pickView.delegate = self
            pickView.dataSource = self
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DH.data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pvDataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DH.selectedWeek = row
    }
    
    
    func setUpNavBarButton() {
        let moreButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.organize, target: self, action: #selector(handleMore))
        navBar.leftBarButtonItem = moreButton
    }
    
    let settingsLauncher = SettingsLauncher()
    
    @objc func handleMore() {
        settingsLauncher.showSettings()
    }
    
  
    
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class DataHandler{
    static let standard = DataHandler()
    //var data = UserDefaults.standard.object(forKey: "DeepData")
    var data = [Week]()
    var selectedWeek = 0
    var selectedStand = 1
    //var blankWeek = Week()
}

