//
//  ViewHomeAnime.swift
//  BTL_IOS
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewHomeAnime: UIViewController {

    @IBOutlet weak var btxAnime: UIButton!
    @IBAction func btxAnime(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btxAnime.setImage(UIImage.init(named: "icons8"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
