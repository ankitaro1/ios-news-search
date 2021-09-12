//
//  SearchNewsViewModel.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma on 13/09/21.
//
//

import Foundation
import UIKit

public protocol SearchNewsFlowDelegate: AnyObject {
    func fetchSearchNewsSuccess(data: [SearchUIDataModel]) 
}

public class SearchNewsViewModel {
    
    let dataSource: SearchNewsDataSource
    weak var delegate: SearchNewsFlowDelegate?
    
    public var searchParameter: String = ""
    
    private init(delegate: SearchNewsFlowDelegate?, dataSource: SearchNewsDataSource) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    public convenience init(delegate: SearchNewsFlowDelegate?) {
        self.init(delegate: delegate, dataSource: SearchNewsDataSource())
    }
    
    
    public func performSearchNewsAction() {
        if searchParameter.isEmpty {
            print("please enter query parameter")
            return
        }
        self.dataSource.callSearchNewsAPI(searchParameter: self.searchParameter) { (response) in
            var list: [SearchUIDataModel] = []
            for item in response.hits {
                list.append(SearchUIDataModel(title: item.title, commentsCount: item.commentCounts, points: item.points, authorName: item.author, url: item.url))
            }
            self.delegate?.fetchSearchNewsSuccess(data: list)
        }
       }
    
}
