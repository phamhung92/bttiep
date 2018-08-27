//
//  ViewAnime.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewAnime: UIViewController,UITabBarDelegate{

   
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 1) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewManga") as! ViewManga
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func Movie(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieView") as! MovieView
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func Special(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SpecialView") as! SpecialView
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
