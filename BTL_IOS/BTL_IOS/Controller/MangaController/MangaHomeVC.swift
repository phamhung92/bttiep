//
//  ViewManga.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MangaHomeVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var arrManga = [APITop]()
    var manga = "manga"
    var oneshots = "oneshots"
    var manhwa = "manhwa"
    var manhua = "manhua"
    var novels = "novels"
    
    // MARK: - viewcontroller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName : MangaTableViewCell.identifier(),bundle : nil), forCellReuseIdentifier: MangaTableViewCell.identifier())
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        Manga(type: manga, name: manga)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        // MARK: - API
    func Manga (type: String,name: String) {
        MangaRoute(endpoint: .APItop(type: type, name: name)) .request { (top) in
            switch top {
            case .successful(let data):
                if let Novels = data as? [APITop]{
                    self.arrManga = Novels
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else {
                    print("Api is error")
                }
            }
        }
    }
    
    // MARK: - setupview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Action
    @IBAction func Oneshots(_ sender: Any) {
        Manga(type: manga, name: oneshots)
    }
    
    @IBAction func Manhwa(_ sender: Any) {
        Manga(type: manga, name: manhwa)
    }
    
    @IBAction func Manga(_ sender: Any) {
        Manga(type: manga, name: manga)
    }
    
    @IBAction func Manhua(_ sender: Any) {
        Manga(type: manga, name: manhua)
    }
    
    @IBAction func Novels(_ sender: Any) {
        Manga(type: manga, name: novels)
    }
}
    // MARK: - Tableview delegate
    extension MangaHomeVC: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MangaVC") as! MangaVC
            vc.ur = arrManga[indexPath.row].url
            vc.name = arrManga[indexPath.row].title
            vc.id = arrManga[indexPath.row].mal_id
            if let urlImg = arrManga[indexPath.row].image_url{
                URLSession.shared.dataTask(with: URL(string: urlImg)!){ data,response,error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                        else { return }
                    DispatchQueue.main.async() {
                        vc.img.image = image
                    }
                }.resume()
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - TableView Datasoure
    extension MangaHomeVC: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrManga.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: MangaTableViewCell.identifier(), for: indexPath) as! MangaTableViewCell
            cell.lblTitle.text = arrManga[indexPath.row].title
            cell.lblMembres.text = String( arrManga[indexPath.row].members!)
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
    }


