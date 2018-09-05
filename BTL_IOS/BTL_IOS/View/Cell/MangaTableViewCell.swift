//
//  MangaTableViewCell.swift
//  BTL_IOS
//
//  Created by manhnv on 9/4/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MangaTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMembres: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func identifier()->String{
        return "MangaTableViewCell"
    }
    
}
