//
//  Article.swift
//  NewsApp
//
// 
//

import Foundation
import ObjectMapper

class Article : Mappable {
    
    dynamic var title : String = ""
    dynamic var urlToImage : String = ""
    dynamic var url : String = ""
   
    
    required convenience init?(map : Map)
    {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        urlToImage <- map["urlToImage"]
        url <- map ["url"]
        
    }
}
