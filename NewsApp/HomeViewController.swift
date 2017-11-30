//
//  HomeViewController.swift
//  NewsApp
//
// 
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper
import Kingfisher

typealias JSONDict = [String : Any]

class HomeViewController: UIViewController
{
    var homeview : HomeView { return self.view as! HomeView }
    var articles : Array< Article> = []
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
//        title = "BBC Recent News"
        
         title = "Google Recent News"
        
        setUptableView()
        
        let params = [
            "source" : "bbc-news",
            "apikey" : "97a62b15de38465b8b0652836e2457cf",
            "sortBy" : "top"
           
        ]
//        https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=97a62b15de38465b8b0652836e2457cf
        
        
        let params1 = [
            "source" : "google-news",
            "apikey" : "97a62b15de38465b8b0652836e2457cf",
            "sortBy" : "top"
            
        ]
        
        
        
    
        Alamofire.request("https://newsapi.org/v1/articles", parameters: params1, encoding: URLEncoding.queryString)
.responseJSON { response in
    
    if let json = response.result.value as? [String : Any]
    {
        
        if let articlearray = json["articles"] as? Array<JSONDict> {
            for articledata in articlearray
            {
                guard let article = Mapper<Article>().map(JSON: articledata) else { continue }
                self.articles.append(article)
            }
        }
        
//        print("Json\(json)")
    }
    self.homeview.tableview.reloadData()
        }
        
    }
    
    func setUptableView()
    {
        homeview.tableview.delegate = self
        homeview.tableview.dataSource = self
        
        
        homeview.tableview.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
    
  }


extension HomeViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let article = articles[indexPath.row]
        
        
        cell.lblArticle?.text = article.title
        if let url = URL(string: article.urlToImage){
            cell.imgThumbnail.kf.setImage(with: url)
        }
        return cell
    }
}


extension HomeViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = articles[indexPath.row]
        
        if let url = URL(string: article.url)
        {
            UIApplication.shared.openURL(url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110.0
    }
}
