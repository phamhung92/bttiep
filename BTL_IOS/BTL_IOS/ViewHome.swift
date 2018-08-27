//
//  ViewHome.swift
//  BTL_IOS
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewHome: UIViewController {

    @IBAction func btxAnime(_ sender: Any) {
        if let vc1 = storyboard?.instantiateViewController(withIdentifier: "ViewHomeAnime") as? ViewHomeAnime{
            present(vc1, animated: true, completion: nil)
            
        }
        
    }
   
    @IBAction func btxManga(_ sender: Any) {
        if let vc2 = storyboard?.instantiateViewController(withIdentifier: "ViewHomeManga") as? ViewHomeManga{
            present(vc2, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
