//
//  CalcFunctions.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/12/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import Foundation

let DH = DataHandler.standard

func CalcSold(sup: Int, item: Int) -> Int{
    var sold = 0

   if DH.selectedWeek != DH.data.count-1{
        let curWeek = DH.data[DH.selectedWeek].supplierArray[sup].itemArray[item]
        let nextWeek = DH.data[DH.selectedWeek + 1].supplierArray[sup].itemArray[item] // out of range if it is the last week in array
        
        if curWeek.countByCase == true{
            sold = curWeek.inventoryQuantity + curWeek.actualOrder + curWeek.moved - nextWeek.inventoryQuantity
        } else{
            sold = curWeek.inventoryQuantity + (curWeek.actualOrder * curWeek.caseQuantity) + curWeek.moved - nextWeek.inventoryQuantity
        }
    }
    
    return sold
}

func OrderSuggestion(sup: Int, item: Int) -> Int{
    let curWeek = DH.data[DH.selectedWeek].supplierArray[sup].itemArray[item]
    var tot = 0
    if DH.data[DH.selectedWeek].supplierArray[sup].itemArray[item].countByCase == false{
            tot = (Baseline(sup: sup, item: item) - curWeek.inventoryQuantity) / curWeek.caseQuantity
    } else{
        tot = Baseline(sup: sup, item: item) - curWeek.inventoryQuantity
    }
    return tot
}

func AverageSoldPerWeek(sup: Int, item: Int) -> Int{
    var avg = 0
    avg = TotalSold(sup: sup, item: item)/DH.data.count
    return avg
}

func TotalSold(sup: Int, item: Int) -> Int{
    var sum = 0
    for week in DH.data{
        sum += week.supplierArray[sup].itemArray[item].sold
    }
    return sum
}

func TotalPurchased(sup: Int, item: Int) -> Int{
    var sum = 0
    for week in DH.data{
        sum += week.supplierArray[sup].itemArray[item].actualOrder
    }
    return sum
}

func Baseline(sup:Int, item:Int) -> Int{
    let base = AverageSoldPerWeek(sup: sup, item: item) +
        DH.data[DH.selectedWeek].supplierArray[sup].itemArray[item].buffer
    return base
}

func BestSeller(sup: Int) -> Item{
    var bestSeller = DH.data[DH.selectedWeek].supplierArray[sup].itemArray[0] //sets best seller to first item
    var index = 0
    for item in DH.data[DH.selectedWeek].supplierArray[sup].itemArray{
        if  TotalSold(sup: sup, item: index) > bestSeller.sold {
            bestSeller = item
        }
        index += 1
    }
    return bestSeller
}



