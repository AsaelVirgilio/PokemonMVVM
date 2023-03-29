//
//  NetworkConnection.swift
//  MVVM1
//
//  Created by Asael Virgilio on 28/03/23.
//

import Foundation
enum NetworkError: Error{
    case urlError
    case canNotParseData
}

class NetworkConnection{
    static func getTrendingMovies(completionHandler: @escaping(_ result: Pokemon?) -> Void){
        
        let urlString = "https://pokeapi.co/api/v2/pokemon/"
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
            let data = dataResponse,
               let resultData = try? JSONDecoder().decode(Pokemon.self, from: data){
                
                completionHandler(resultData)
                
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
}
