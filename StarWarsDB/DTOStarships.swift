//
//  DTOStarships.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import Foundation

// MARK: - DTOStarships
struct DTOStarships: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

// MARK: - Result
struct Starship: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let mglt: String
    let starshipClass: String
    let pilots: [String]?
    let films: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case pilots, films, created, edited, url
    }
    
    var starshipDescription: String {
        if let starshipsArray = pilots, !starshipsArray.isEmpty {
            return starshipsArray.joined(separator: ", ")
        } else {
            return "There are not pilots "
        }
    }
}
