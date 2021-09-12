//
//  SearchNewsDataSource.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma on 13/09/21.
//
//

 
import Alamofire

class SearchNewsDataSource {
    
    func callSearchNewsAPI(searchParameter: String, successCallBack: @escaping (SearchNewsResponseDAO) -> Void) {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?query=\(searchParameter)") else {
            print("something went wrong in url")
           return
         }
        
        AF.request(url,method: .get).validate().responseDecodable(of: SearchNewsResponseDAO.self) { response in
            if let item = response.value {
                successCallBack(item)
            } else {
                print(response.error)
                print("something went wrong in api response")
            }
        }
    }
    
}

