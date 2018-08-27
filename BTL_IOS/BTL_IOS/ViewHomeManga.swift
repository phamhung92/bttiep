//
//  ViewHomeManga.swift
//  BTL_IOS
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewHomeManga: UIViewController {
    

    @IBOutlet weak var btxManga: UIButton!
    @IBAction func btxManga(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btxManga.setImage(UIImage.init(named: "icons8"),for : .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
