//
//  File.swift
//  Tranning8_9
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
class TableViewCellMusic: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblArtis: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
