//
//  TabBarItem.swift
//  BTL_IOS
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TabBarItem: UITabBarController,UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let vc = viewController as? ViewManga{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
