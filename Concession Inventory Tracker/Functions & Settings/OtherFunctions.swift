//
//  OtherFunctions.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/19/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
}



