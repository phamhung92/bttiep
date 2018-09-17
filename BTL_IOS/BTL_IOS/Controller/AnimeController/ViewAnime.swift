//
//  ViewAnime.swift
//  BTL_IOS
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
// REVIEW: Đổi tên class. Các class ViewController
class ViewAnime: UIViewController,UITabBarDelegate,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tableView: UITableView!
    
    var arrAnime = [APITop]()
    

    // REVIEW: Sửa lại tên hàm theo dạng lower camel case
    // Mấy hàm gọi API này giống hệt nhau, khác mỗi endpoint thì viết chung vào 1 hàm rồi dùng lại thôi
    @IBAction func Spacial(_ sender: Any) {
        MangaRoute(endpoint: .search2) .request { (top) in
            switch top{
            case .success(let data):
                // REVIEW: Chú ý thêm dấu cách giữa các dấu ngoặc
                if let Animes = data as? [APITop]{
                    self.arrAnime = Animes
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }else{
                    print("Api is error")
                }
                // REVIEW: Không cần hàm return ở đây và ở dưới
                return
            case .fauilure(let error):
                print(error)
                return
            }
        }
    }
    @IBAction func Upcomming(_ sender: Any) {
        MangaRoute(endpoint: .search) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Animes = data as? [APITop]{
                    self.arrAnime = Animes
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
    
    // REVIEW: Căn lại lề. Xóa các dòng trống không cần thiết
    @IBAction func Movie(_ sender: Any) {
        MangaRoute(endpoint: .search1) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Animes = data as? [APITop]{
                    self.arrAnime = Animes
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
    
    // REVIEW: Sắp xếp lại thứ tự các hàm như sau:
    // ViewController's lifecycle (viewDidLoad, viewWillAppear,...)
    // Setup view
    // Lấy dữ liệu, gọi API
    // Action
    // DataSource và Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName : MangaTableViewCell.identifier(),bundle : nil), forCellReuseIdentifier: MangaTableViewCell.identifier())
        tableView.rowHeight = UITableViewAutomaticDimension
        
        MangaRoute(endpoint: .search) .request { (top) in
            switch top{
                
            case .success(let data):
                if let Animes = data as? [APITop]{
                    self.arrAnime = Animes
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
    
    // REVIEW: Đưa datasource và delegate của Tableview ra 2 extensions riêng
    //MARK TabbleView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAnime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MangaTableViewCell.identifier(), for: indexPath) as! MangaTableViewCell
        cell.lblTitle.text = arrAnime[indexPath.row].title
        cell.lblMembres.text = String(describing: arrAnime[indexPath.row].members)
        cell.lblLink.text = arrAnime[indexPath.row].url
        if let urlImg = arrAnime[indexPath.row].image_url{
            // REVIEW: Kiểm tra nil, không dùng force unwrap thế này
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AnimeVC1")
        self.navigationController?.pushViewController(vc!, animated: true)
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
