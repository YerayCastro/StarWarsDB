//
//  DTOPeople.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import Foundation



// MARK: - DTO for API response
struct DTOPeople: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [People]
}

// MARK: - Individual Person
struct People: Codable, Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass, gender, homeworld, films, species, vehicles, starships, created, edited, url
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
    
    var speciesDescription: String {
        if let speciesArray = species, !speciesArray.isEmpty {
            return speciesArray.joined(separator: ", ")
        } else {
            return "It has no species"
        }
    }
    var vehiclesDescription: String {
        if let vehiclesArray = vehicles, !vehiclesArray.isEmpty {
            return vehiclesArray.joined(separator: ", ")
        } else {
            return "He doesn't have a vehicle"
        }
    }
    var starshipDescription: String {
        if let starshipArray = starships, !starshipArray.isEmpty {
            return starshipArray.joined(separator: ", ")
        } else {
            return "Doesn't have a starship"
        }
    }
}

