//
//  DTOFilms.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import Foundation


// MARK: - DTOFilms
struct DTOFilms: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Films]
}

// MARK: - Result
struct Films: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    let episodeID: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}
