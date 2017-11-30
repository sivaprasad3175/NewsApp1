//
//  NewsCell.swift
//  NewsApp
//
//  
//

import Foundation
import UIKit

class NewsCell : UITableViewCell
{
    
    @IBOutlet weak var lblArticle: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!
    
    class func InstanceFromNib() -> NewsCell
    {
      return UINib(nibName: "NewsCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NewsCell
    }
    
}
