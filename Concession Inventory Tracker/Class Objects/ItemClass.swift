//
//  ItemClass.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import Foundation

class Item {
    //Ints because no partial cases calculated?
    var name = ""
    var caseQuantity = 0
    var inventoryQuantity = 0
    var moved = 0
    var actualOrder = 0
    var orderSugestion = 0
    var sold = 0
    var buffer = 0
    var countByCase = true
    var supplier = 1000
    var index = 1000
    
    init(name1: String, caseQuan: Int, invQuantity: Int, numMoved: Int,
         actOrder: Int, orderSug: Int, numSold: Int, buff: Int, cntbyCse: Bool,
         sup: Int, ind: Int){
        name = name1
        caseQuantity = caseQuan
        inventoryQuantity = invQuantity
        moved = numMoved
        actualOrder = actOrder
        orderSugestion = orderSug
        sold = numSold
        buffer = buff
        countByCase = cntbyCse
        supplier = sup
        index = ind
    }
    
    init(name1: String, caseQuan: Int, sup: Int, ind: Int){
        name = name1
        caseQuantity=caseQuan
        supplier = sup
        index = ind
    }
    
    init(name1: String, caseQuan: Int, cntByCase: Bool, sup: Int, ind: Int){
        name = name1
        caseQuantity=caseQuan
        countByCase = cntByCase
        supplier = sup
        index = ind
    }
}
