//
//  ViewController.swift
//  TCG_cards
//
//  Created by pat002889 on 03/05/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel: PokemonViewModel = PokemonViewModel(service: PokemonService(url: "https://api.pokemontcg.io/v2/cards?pageSize=30"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        DispatchQueue.global().async {
            self.viewModel.fetchItens(completion: {result in
                if(result) {
                    self.tableView.reloadData()
                }
            })
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        
        
        if(viewModel.items.count != 0 ) {
            let item = viewModel.items[indexPath.row]
            cell.pokemonName.text = item.name
            if let price = item.tcgplayer?.prices?.holofoil?.market {
                cell.pokemonPrice.text = "$\(String(describing: (price)))"
            }
            AppPipes().downloadImage(from: URL(string: item.images?.large ?? "")!, imageView: cell.pokemonImage)
            cell.pokemonType.text = item.types![0]
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "carddetails", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PokemonDetailsViewController {
            destination.card = viewModel.items[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    
    
    
}
