// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cards = try? newJSONDecoder().decode(PokemonAPI.self, from: jsonData)

import Foundation

// MARK: - PokemonAPI
struct PokemonAPI: Decodable {
    let data: [Cards]
    let page, pageSize, count, totalCount: Int
}

// MARK: - Cards
struct Cards: Decodable {
    let id, name, supertype: String?
    let subtypes: [String]?
    let level: String?
    let hp: String?
    let types: [String]?
    let attacks: [Attack]?
    let weaknesses: [Resistance]?
    let resistances:[Resistance]?
    let retreatCost: [String]?
    let convertedRetreatCost: Int?
    let datumSet: Set?
    let number, artist, rarity: String?
    let nationalPokedexNumbers: [Int]?
    let legalities: Legalities?
    let images: CardsImages?
    let tcgplayer: Tcgplayer?
    let cardmarket: Cardmarket?
    let evolvesFrom: String?
    let abilities: [Ability]?

    enum CodingKeys: String, CodingKey {
        case id, name, supertype, subtypes, level, hp, types, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
        case datumSet = "set"
        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket, evolvesFrom, abilities
    }
}

// MARK: - Ability
struct Ability: Codable {
    let name, text, type: String?
}

// MARK: - Attack
struct Attack: Codable {
    let name: String?
    let cost: [String]?
    let convertedEnergyCost: Int?
    let damage, text: String?
}

// MARK: - Cardmarket
struct Cardmarket: Codable {
    let url: String?
    let updatedAt: String?
    let prices: [String: Double]?
}

// MARK: - Set
struct Set: Codable {
    let id, name, series: String?
    let printedTotal, total: Int?
    let legalities: Legalities?
    let ptcgoCode, releaseDate, updatedAt: String?
    let images: SetImages?
}

// MARK: - SetImages
struct SetImages: Codable {
    let symbol, logo: String?
}

// MARK: - Legalities
struct Legalities: Codable {
    let unlimited: String?
}

// MARK: - CardsImages
struct CardsImages: Codable {
    let small, large: String?
}

// MARK: - Resistance
struct Resistance: Codable {
    let type, value: String?
}

// MARK: - Tcgplayer
struct Tcgplayer: Codable {
    let url: String?
    let updatedAt: String?
    let prices: Prices?
}

// MARK: - Prices
struct Prices: Codable {
    let holofoil: Holofoil?
    let reverseHolofoil: Holofoil?
}

// MARK: - Holofoil
struct Holofoil: Codable {
    let low, mid, high, market: Double?
}
