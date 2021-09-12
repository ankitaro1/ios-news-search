//
//  NewsTableViewCell.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma7 on 13/09/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    
    @IBOutlet var otherDescLabel: UILabel?
    
    var data: SearchUIDataModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData() {
        if data != nil {
        self.titleLabel?.text = data?.title
            self.otherDescLabel?.text = "Points: \(data?.points ?? 0) | comments: \(data?.commentsCount ?? 0) | Author: \(data?.authorName ?? "")"
        } else {
            self.titleLabel?.text = ""
            self.otherDescLabel?.text = ""
        }
    }

}
