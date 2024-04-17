//
//  Network.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import Foundation

protocol DataInteractor {
    func getPeople(from url: URL) async throws -> (people: [People], nextPage: URL?)
    func getSpecie(from url: URL) async throws -> (specie: [Specie], nextPage: URL?)
    func getPlanet(from url: URL) async throws -> (planet: [Planet], nextPage: URL?)
    func getVehicle(from url: URL) async throws -> (vehicle: [Vehicles], nextPage: URL?)
    func getStarship(from url: URL) async throws -> (starship: [Starship], nextPage: URL?)
    func getFilms(from url: URL) async throws -> (film: [Films], nextPage: URL?)
}


struct Network: DataInteractor {
    func getPeople(from url: URL) async throws -> (people: [People], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOPeople.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
    func getSpecie(from url: URL) async throws -> (specie: [Specie], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOSpecies.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
    func getPlanet(from url: URL) async throws -> (planet: [Planet], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOPlanets.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
    func getVehicle(from url: URL) async throws -> (vehicle: [Vehicles], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOVehicles.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
    func getStarship(from url: URL) async throws -> (starship: [Starship], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOStarships.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
    func getFilms(from url: URL) async throws -> (film: [Films], nextPage: URL?) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(DTOFilms.self, from: data)

        let nextPageURL = decodedResponse.next != nil ? URL(string: decodedResponse.next!) : nil
        return (decodedResponse.results, nextPageURL)
    }
    
}


