//
//  SettingCell.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/23/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.frame = CGRect(x: 50, y: -10, width: 100, height: 100)//make left justified and add constraints
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        
        backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
}


