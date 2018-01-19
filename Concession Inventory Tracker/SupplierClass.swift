//
//  SupplierClass.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/11/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import Foundation

class Supplier{
    enum company {
        case coke
        case graves
        case feericks
        case defaultSup
    }
    
    var itemArray = [Item]()
    
    init(comp: company){
        switch comp {
        case .coke:
            //add Coke Item deafults once app loads data is saved and can be manipulated.
            CokeDefaults()
            break
        case .feericks:
            FeericksDefaults() //Not Done!!!!
            break
        case .graves:
            GraveDefaults()
            break
        case .defaultSup:
            
            break
        }
    }
    
    
    func FeericksDefaults(){
        itemArray.append(Item(name1: "Snickers", caseQuan: 48, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Reeses", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Kit Kat", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Twix", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Hershey's", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "M&M's Plain", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Peanut M&M's", caseQuan: 48, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Skittles", caseQuan: 36, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Sour Skittles", caseQuan: 24, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Xtremes", caseQuan: 24, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Red Punch Straws", caseQuan: 24, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Ring Pops", caseQuan: 24, sup: 2, ind: itemArray.count))
        itemArray.append(Item(name1: "Seasoned Salt", caseQuan: 1, sup: 2, ind: itemArray.count))
    }
    
    func GraveDefaults(){
        itemArray.append(Item(name1: "Hot Dogs", caseQuan: 40, cntByCase: false, sup: 1, ind: itemArray.count))
        itemArray.append(Item(name1: "Hot Dog Buns", caseQuan: 72, cntByCase: false, sup: 1, ind: itemArray.count))
        itemArray.append(Item(name1: "Hamburger Buns", caseQuan: 120, cntByCase: false, sup: 1, ind: itemArray.count))
        itemArray.append(Item(name1: "Beef Paties", caseQuan: 60, cntByCase: false, sup: 1, ind: itemArray.count))
        itemArray.append(Item(name1: "Cheese Slices", caseQuan: 4, cntByCase: false, sup: 1, ind: itemArray.count))
        itemArray.append(Item(name1: "Chili", caseQuan: 6, cntByCase: false, sup: 1, ind: itemArray.count))
        //needs Finished
    }
    
    func CokeDefaults(){
        itemArray.append(Item(name1: "Coke", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Diet Coke", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Sprite", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Mr. Pibb", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Root Beer", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Mellow Yellow", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Fanta", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Water", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Red Powerade", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Yellow Powerade", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Blue Powerade", caseQuan: 24, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "Sweet Tea", caseQuan: 12, sup: 0, ind: itemArray.count))
        itemArray.append(Item(name1: "UnSweet Tea", caseQuan: 12, sup: 0, ind: itemArray.count))
    }
    
}
