//
//  HomeView.swift
//  NewsApp
//
//  
//

import Foundation
import UIKit
import SnapKit


class HomeView : UIView
{
    
    let tableview = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableview)
        setuplayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init codec has not implemented")
    }
    
    func  setuplayout()
    {
        tableview.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }

}
