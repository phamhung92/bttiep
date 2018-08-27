//
//  CellManga.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CellManga: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblNameMaga: UILabel!
    @IBOutlet weak var lblNameTg: UILabel!
    @IBOutlet weak var lblNhanVat: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
