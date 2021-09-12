//
//  SearchUIDataModel.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma7 on 13/09/21.
//

import Foundation



public struct SearchUIDataModel {
    let title: String
    let commentsCount: Int
    let points: Int
    let authorName: String
    let url: String
    
    public init(title: String, commentsCount: Int, points: Int, authorName: String, url: String) {
        self.title = title
        self.commentsCount = commentsCount
        self.points = points
        self.authorName = authorName
        self.url = url
    }
}
