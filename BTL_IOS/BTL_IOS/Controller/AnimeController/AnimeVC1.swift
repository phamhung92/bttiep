//
//  AnimeVC1.swift
//  BTL_IOS
//
//  Created by Admin on 9/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
class AnimeVC1: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var arr = [APIanh]()
    @IBOutlet weak var imgAnime: UIImageView!
    @IBOutlet weak var lblTG: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    var id: Int?
    var name: String?
    var ur: String?
    @IBOutlet weak var collection: UICollectionView!
    
    //     MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        lblTG.text = name
        lblLink.text = ur
        collection.register(UINib(nibName: CollectionCell.identifier(),bundle: nil), forCellWithReuseIdentifier: CollectionCell.identifier())
        MangaRoute(endpoint: .anime(id: id!)) .request { (pictures) in
            switch pictures {
            case .successful(let data):
                if let Animes = data as? [APIanh] {
                    self.arr = Animes
                    DispatchQueue.main.sync {
                        self.collection.reloadData()
                    }
                }else {
                    print("Api is error")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            if let urlImg = arr[indexPath.row].large{
                URLSession.shared.dataTask(with: URL(string: urlImg)!){ data,response,error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                        else { return }
                    DispatchQueue.main.async() {
                        cell.imgview.image = image
                    }
                }.resume()
            }

        return cell
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
