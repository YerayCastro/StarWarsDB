//
//  URL.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import Foundation

let url = URL(string: "https://swapi.dev/api/")!
extension URL {
    static let urlPeople = url.appending(path: "/people")
    static let urlSpecies = url.appending(path: "/species")
    static let urlPlantes = url.appending(path: "/planets")
    static let urlVehicles = url.appending(path: "/vehicles")
    static let urlStarships = url.appending(path: "/starships")
    static let urlFilms = url.appending(path: "/films")
}

