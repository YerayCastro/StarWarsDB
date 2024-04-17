//
//  DTOVehicles.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import Foundation


// MARK: - DTOVehicles
struct DTOVehicles: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicles]
}

// MARK: - Result
struct Vehicles: Codable, Identifiable, Hashable {
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
    let vehicleClass: String
    let pilots: [String]?
    let films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case vehicleClass = "vehicle_class"
        case pilots, films, created, edited, url
    }
    
    
    var pilotsDescription: String {
        if let pilotsArray = pilots, !pilotsArray.isEmpty {
            return pilotsArray.joined(separator: ", ")
        } else {
            return "There are not pilots "
        }
    }
}
