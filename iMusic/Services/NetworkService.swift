//
//  NetworkService.swift
//  iMusic
//
//  Created by Danya Kukhar on 17.08.2022.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, complition: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": "\(searchText)",
                         "limit": "10",
                          "media": "music"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Error received requesting data: \(error.localizedDescription)")
                complition(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("object: ", objects)
                complition(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                complition(nil)
            }
//                let someString = String(data: data, encoding: .utf8)
//                print(someString ?? "")
        }
    }
    
}
