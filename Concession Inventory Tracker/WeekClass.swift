//
//  WeekClass.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import Foundation

class Week {
    var supplierArray = [Supplier]()
    //var weekNum = 1000
    var finInv = false
    
    init(){
        //weekNum = weekNumber
        supplierArray.append(Supplier(comp: .coke))
        supplierArray.append(Supplier(comp: .graves))
        supplierArray.append(Supplier(comp: .feericks))
    }
//    func ToString() -> String{
//        return
//    }
}
