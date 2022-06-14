//
//  PokemonService.swift
//  TCGPokemonCards
//
//  Created by Yhan Nunes on 13/06/22.
//

import Foundation
import Alamofire
import Bow

class PokemonService {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func getJson(completion: @escaping (Either<Failures,[Cards]>)->Void){
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                  return
                }
                do {
                    let dataPokemonAPI = try JSONDecoder().decode(PokemonAPI.self, from: data)
                    let cards = dataPokemonAPI.data
                    completion(Either.right(cards))
                } catch {
                    completion(Either.left(Failures.unknown))
                    print(error)
                }
            }
        }
}
