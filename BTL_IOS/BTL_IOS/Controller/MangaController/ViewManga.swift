//
//  ViewManga.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewManga: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrManga = [APITop]()

    @IBAction func Oneshots(_ sender: Any) {
        MangaRoute(endpoint: .oneshots) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Oneshots = data as? [APITop]{
                    self.arrManga = Oneshots
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    
    @IBAction func Manhwa(_ sender: Any) {
        MangaRoute(endpoint: .manhwa) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Manhwwa = data as? [APITop]{
                    self.arrManga = Manhwwa
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    @IBAction func Manga(_ sender: Any) {
        MangaRoute(endpoint: .manga) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Manga = data as? [APITop]{
                    self.arrManga = Manga
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    @IBAction func Manhua(_ sender: Any) {
        MangaRoute(endpoint: .manhua) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Manhua = data as? [APITop]{
                    self.arrManga = Manhua
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    @IBAction func Novels(_ sender: Any) {
        MangaRoute(endpoint: .novels) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Novels = data as? [APITop]{
                    self.arrManga = Novels
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrManga.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MangaTableViewCell.identifier(), for: indexPath) as! MangaTableViewCell
        cell.lblTitle.text = arrManga[indexPath.row].title
        cell.lblMembres.text = String(describing: arrManga[indexPath.row].members)
        cell.lblLink.text = arrManga[indexPath.row].url
        if let urlImg = arrManga[indexPath.row].image_url{
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
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName : MangaTableViewCell.identifier(),bundle : nil), forCellReuseIdentifier: MangaTableViewCell.identifier())
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        MangaRoute(endpoint: .manga) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Manga = data as? [APITop]{
                    self.arrManga = Manga
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MangaVC1")
        self.navigationController?.pushViewController(vc!, animated: true)
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
