//
//  DTOPlanets.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import Foundation

struct DTOPlanets: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

// MARK: - Result
struct Planet: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]?
    let films: [String]?
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
    
    var residentsDescription: String {
        if let residentsArray = residents, !residentsArray.isEmpty {
            return residentsArray.joined(separator: ", ")
        } else {
            return "There are not residents "
        }
    }
}
