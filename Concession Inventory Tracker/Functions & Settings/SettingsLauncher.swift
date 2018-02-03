//
//  SettingsLauncher.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/22/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import UIKit
class Setting: NSObject{
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
class SettingsLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let blackView = UIView()
    var standArray = ["Add Stand","Stand 1"]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
        return cv
    }()
    
    
    let cellId = "cellID"
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            let height: CGFloat = 400
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 0.5
                
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
            
        })
        
        
    }
    
//    @objc func handleReName(gesture: UILongPressGestureRecognizer!){
//        if gesture.state != .ended{
//            return
//        }
//        let p = gesture.location(in: self.collectionView)
//        if let indexPath = self.collectionView.indexPathForItem(at: p){
//            let cell = self.collectionView.cellForItem(at: indexPath)
//            let alert = UIAlertController(title: "Rename Stand?", message: "Enter Stand Name", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addTextField()
//            alert.textFields![0].text = ""
//            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction!) in
//                if let str = alert.textFields![0].text{
//                    self.standArray[indexPath.row] = str
//
//                }
//                self.collectionView.reloadData()
//            }))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//
//            }))
//            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//        } else {
//            print("Could not find Index Path in handleReName")
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        let setting1 = standArray[indexPath.row]
        cell.nameLabel.text = setting1
        //cell.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleReName)))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let alert = UIAlertController(title: "Add Stand?", message: "Enter Stand Name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addTextField()
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction!) in
                if let str = alert.textFields![0].text{
                    self.standArray.append(str)
                }
                collectionView.reloadData()
                //set selected stand to recently added stand
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                
            }))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        } else{
             DH.selectedStand = indexPath.row
        }
        
        handleDismiss()
 
    }
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
}
