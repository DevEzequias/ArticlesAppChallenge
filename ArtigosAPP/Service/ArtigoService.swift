//
//  ArtigoService.swift
//  ArtigosAPP
//
//  Created by Ezequias Santos on 30/11/22.
//

import Foundation
import Alamofire

class ArtigoService {
    
    static let sharedInstance = ArtigoService()
    
    func fetchArtigo( _ completion: @escaping(_ apiData: ArtigoModelResponse) -> Void) {
        let url: String
        url = "https://newsapi.org/v2/everything?q=tesla&from=2022-11-01&sortBy=publishedAt&apiKey=6b31d6a06672402bb2d81519adc8d4f8"
        
        AF.request(url, method: .get, encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(ArtigoModelResponse.self, from: data!)
                    completion(jsondata)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
