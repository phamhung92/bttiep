//
//  MangaVC.swift
//  BTL_IOS
//
//  Created by Admin on 9/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MangaVC: UIViewController,UICollectionViewDelegate{
    
    var arr = [APIanh]()
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLinh: UILabel!
    @IBOutlet weak var Collectionview: UICollectionView!
    var id : Int?
    var name : String?
    var ur : String?
    
//     MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        Collectionview.delegate = self
        Collectionview.dataSource = self
        lblName.text = name
        lblLinh.text = ur
        Collectionview.register(UINib(nibName : CollectionCell.identifier(),bundle : nil), forCellWithReuseIdentifier: CollectionCell.identifier())
        MangaRoute(endpoint: .manga1(id: id!)) .request { (pictures) in
            switch pictures {
            case .successful(let data):
                if let Animes = data as? [APIanh] {
                    self.arr = Animes
                    DispatchQueue.main.sync {
                        self.Collectionview.reloadData()
                    }
                }else {
                    print("Api is error")
                }
            case .fauilure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    
    // MARK: - CollectionView
    extension MangaVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        if let urlImg = arr[indexPath.row].large {
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
}
