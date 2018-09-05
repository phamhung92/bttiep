//
//  MovieView.swift
//  BTL_IOS
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MovieView: UIViewController,UITabBarDelegate,UITableViewDelegate,UITableViewDataSource{
   
    
    @IBOutlet weak var MovieTableView: UITableView!
    var arrMoview = [APITop]()
    
    //MARK present
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

        MovieTableView.delegate = self
        MovieTableView.dataSource = self
        MovieTableView.register(UINib(nibName: "CellManga", bundle: nil), forCellReuseIdentifier: "CellManga")
        MangaRoute(endpoint: .search1) .request{ (top) in
            switch top {
            case .success(let data):
                if let Movie = data as? [APITop]{
                    self.arrMoview = Movie
                    DispatchQueue.main.async {
                        self.MovieTableView.reloadData()
                    }
                }else{
                    print("API error")
                }
                
            case .fauilure(let error):
                print(error)
            }
        
        
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMoview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellManga", for: indexPath) as! CellManga
        cell.lblTitle.text = arrMoview[indexPath.row].title
        cell.lblMembres.text = String(describing: arrMoview[indexPath.row].members)
        cell.lblLink.text = arrMoview[indexPath.row].url
        if let urlImg = arrMoview[indexPath.row].image_url{
            URLSession.shared.dataTask(with: URL(string: urlImg)!){ data,response,error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    cell.imgView.image = image
                    }
                }.resume()
            
        
                
            }
        

        return cell
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
