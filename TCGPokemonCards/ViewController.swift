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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getJson(url: "https://api.pokemontcg.io/v2/cards?pageSize=150", completion: { cards in
            print(cards)
//            print("Do something with this fucking card var")
            
        })
        // Do any additional setup after loading the view.
    }
    
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


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "carddetails", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailVC {
//            destination.product = productArray[(tblAppleProducts.indexPathForSelectedRow?.row)!]
//            tblAppleProducts.deselectRow(at: tblAppleProducts.indexPathForSelectedRow!, animated: true)
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    
    
    
}
