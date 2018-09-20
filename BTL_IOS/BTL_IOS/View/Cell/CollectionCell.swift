//
//  CollectionCell.swift
//  BTL_IOS
//
//  Created by Admin on 9/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgview: UIImageView!

    class func identifier()->String {
        return "CollectionCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
