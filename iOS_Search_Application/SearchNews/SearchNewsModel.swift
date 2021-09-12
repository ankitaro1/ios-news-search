//
//  SearchNewsModel.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma on 13/09/21.
//
//

import Foundation


class SearchNewsResponseDAO: Decodable {
    let hits: [SearchResponseDao]
   
    enum CodingKeys: String, CodingKey {
      case hits
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hits = try container.decode([SearchResponseDao].self, forKey: .hits)
      }
}

class SearchResponseDao: Decodable {
    let title: String
    let url: String
    let author: String
    let commentCounts: Int
    let points: Int
    
    
    enum CodingKeys: String, CodingKey {
      case title, url, author, points
        case commentCounts = "num_comments"
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        author = try container.decode(String.self, forKey: .author)
        commentCounts = try container.decode(Int.self, forKey: .commentCounts)
        points = try container.decode(Int.self, forKey: .points)
      }
}
