//
//  PokemonViewModel.swift
//  TCGPokemonCards
//
//  Created by Yhan Nunes on 13/06/22.
//

import Foundation

class PokemonViewModel {
    private let service: PokemonService?
    private(set) var items = [Cards]()

    init(service: PokemonService) {
        self.service = service
    }
    
    func addItems(_ items: [Cards]) {
        self.items.append(contentsOf: items)
    }
       
    func removeAllItems() {
        items.removeAll()
    }
    
    func fetchItens(completion: @escaping (Bool) -> Void) {
        service?.getJson(completion: { handler in
            handler.fold({ l in
                completion(false)
            }, {r in
                self.addItems(r)
                completion(true)
            })
        })
    }
}
