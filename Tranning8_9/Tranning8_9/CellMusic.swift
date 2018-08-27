//
//  CellMusic.swift
//  Tranning8_9
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CellMusic: UITableViewCell {

    @IBOutlet weak var lblAris: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
