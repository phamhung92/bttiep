//
//  ViewNovels.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewNovels: UIViewController, UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAnime") as! ViewAnime
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func Manhwa(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ManhwaView") as! ManhwaView
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func Manhua(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ManhuaView") as! ManhuaView
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func Oneshots(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OneshotsView") as! OneshotsView
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func Manga(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewManga") as! ViewManga
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
