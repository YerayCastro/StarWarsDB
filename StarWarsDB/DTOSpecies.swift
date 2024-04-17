//
//  DTOSpecies.swift
//  StarWarsDB
//
//  Created by Yery Castro on 3/4/24.
//

import Foundation


// MARK: - DTOEspecies
struct DTOSpecies: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}

// MARK: - Result
struct Specie: Codable, Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    let classification: String
    let designation: Designation
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, classification, designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld, language, people, films, created, edited, url
    }
}

enum Designation: String, Codable {
    case reptilian = "reptilian"
    case sentient = "sentient"
}
