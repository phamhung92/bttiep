//
//  ViewAnime.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class AnimeHomeVC: UIViewController,UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var arrAnime = [APITop]()
    var ma: Int?
    var anime = "anime"
    var upcoming = "upcoming"
    var special = "special"
    var movie = "movie"
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MangaTableViewCell.identifier(),bundle: nil), forCellReuseIdentifier: MangaTableViewCell.identifier())
        tableView.rowHeight = UITableViewAutomaticDimension
        Anime(type: anime, name: upcoming)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - setup View
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - API
    func Anime(type: String,name: String) {
        MangaRoute(endpoint: .APItop(type: type, name: name)) .request { (top) in
            switch top {
            case .successful(let data):
                if let Novels = data as? [APITop] {
                    self.arrAnime = Novels
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else {
                    print("Api is error")
                }
            }
        }
    }
    
    // MARK: - Action
    @IBAction func Spacial(_ sender: Any) {
        Anime(type: anime, name: special)
        }
    
    @IBAction func Upcomming(_ sender: Any) {
        Anime(type: anime, name: upcoming)
        }
    
    @IBAction func Movie(_ sender: Any) {
        Anime(type: anime, name: movie)
        }
    }

    // MARK: - TabbleView delegate
    extension AnimeHomeVC: UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AnimeVC1") as! AnimeVC1
            vc.ur = arrAnime[indexPath.row].url
            vc.name = arrAnime[indexPath.row].title
            vc.id = arrAnime[indexPath.row].mal_id
            if let urlImg = arrAnime[indexPath.row].image_url{
                URLSession.shared.dataTask(with: URL(string: urlImg)!){ data,response,error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                        else { return }
                    DispatchQueue.main.async() {
                     vc.imgAnime.image = image
                        }
                    }.resume()
                }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - TabbleView datasource
    extension AnimeHomeVC: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrAnime.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: MangaTableViewCell.identifier(), for: indexPath) as! MangaTableViewCell
            cell.lblTitle.text = arrAnime[indexPath.row].title
            cell.lblMembres.text = String( arrAnime[indexPath.row].members!)
            if let urlImg = arrAnime[indexPath.row].image_url{
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
