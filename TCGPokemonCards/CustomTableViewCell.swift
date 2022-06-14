//
//  CustomTableViewCell.swift
//  TCGPokemonCards
//
//  Created by Yhan Nunes on 11/06/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonView: UIView!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonPrice: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
}
