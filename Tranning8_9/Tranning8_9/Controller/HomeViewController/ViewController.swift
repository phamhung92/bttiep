//
//  ViewController.swift
//  Tranning8_9
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var arrMusic = [MusicModel]()
    var 		newarrMusic = [MusicModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        MusicRouter(endpoint: .search).request { (result) in
            switch result{
            case .success(let data):
                
                if let musics = data as? [MusicModel]{
                    self.arrMusic = musics
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                return
            case .fauilure(let err):
                print(err)
                return
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblAris.text = arrMusic[indexPath.row].artistName
        cell.lblName.text = arrMusic[indexPath.row].trackName
        cell.lblTime.text = "\(arrMusic[indexPath.row].trackTimeMillis ?? 0 )"
        if let urlImg = arrMusic[indexPath.row].artworkUrl100{
            URLSession.shared.dataTask(with:URL(string: urlImg)!) { data, response, error in
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
        return 100
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        newarrMusic = arrMusic.filter({ animal -> Bool in
            guard let text = searchBar.text else {return false}
            return (animal.trackName?.contains(text))!
     		   })
        if(searchBar.text == ""){
            MusicRouter(endpoint: .search).request { (result) in
                switch result{
                case .success(let data):
                    
                    if let musics = data as? [MusicModel]{
                        self.arrMusic = musics
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }else{
                        print("Api is error")
                    }
                    return
                case .fauilure(let err):
                    print(err)
                    return
                }
            }
        }
        else {
            self.arrMusic = newarrMusic
            DispatchQueue.main.async {
                self.tableView.reloadData()
            
            }
        }
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(false)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

