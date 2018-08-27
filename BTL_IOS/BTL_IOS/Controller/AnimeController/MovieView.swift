//
//  MovieView.swift
//  BTL_IOS
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MovieView: UIViewController,UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 3 ){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewManga") as! ViewManga
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func Upcoming(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAnime") as! ViewAnime
        present(vc, animated: true, completion: nil)
        
    }

    @IBAction func special(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SpecialView") as! SpecialView
        present(vc, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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