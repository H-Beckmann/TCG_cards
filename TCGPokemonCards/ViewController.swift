//
//  ViewController.swift
//  TCG_cards
//
//  Created by pat002889 on 03/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson(url: "https://api.pokemontcg.io/v2/cards?pageSize=150", completion: { cards in
            print(cards)
            print("Do something with this fucking card var")
            
        })
        // Do any additional setup after loading the view.
    }
    
//    func getJson(url: String){
//        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON{
//            (responseData) in
//            let dictionary = (responseData.value as! NSDictionary)["data"]
//            do{
//                let cards = try JSONDecoder().decode([Card].self, from: dictionary as! Data)
//                print(cards)
//            }catch{
//                print(error)
//            }
//            }
//        }
    
    func getJson(url: String, completion: @escaping ([Cards])->Void){
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                  return
                }
                do {
                    let dataPokemonAPI = try JSONDecoder().decode(PokemonAPI.self, from: data)
                    let cards = dataPokemonAPI.data
                    completion(cards)
                } catch {
                    print(error)
                }
            }
        }
}
