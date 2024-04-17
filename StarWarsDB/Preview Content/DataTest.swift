//
//  DataTest.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import Foundation


struct DataTest: DataInteractor {
    func getPeople(from url: URL) async throws -> (people: [People], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testPeoples", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOPeople.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
    }
    
    func getSpecie(from url: URL) async throws -> (specie: [Specie], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testSpecies", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOSpecies.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
        }
    
    func getPlanet(from url: URL) async throws -> (planet: [Planet], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testPlanets", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOPlanets.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
        }
    
    func getVehicle(from url: URL) async throws -> (vehicle: [Vehicles], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testVehicles", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOVehicles.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
    }
    func getStarship(from url: URL) async throws -> (starship: [Starship], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testStarships", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOStarships.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
    }
    
    func getFilms(from url: URL) async throws -> (film: [Films], nextPage: URL?) {
        // Asume que usas directamente la URL del archivo local sin importar el parámetro `url` proporcionado.
        guard let fileURL = Bundle.main.url(forResource: "testFilms", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: fileURL)
        let response = try JSONDecoder().decode(DTOFilms.self, from: data)
        
        // Como es un archivo local, no tendrás una "próxima página" URL real.
        // Puedes optar por retornar nil o simular una URL si estás probando la lógica de paginación.
        let nextPageURL = URL(string: response.next ?? "")
        
        return (response.results, nextPageURL)
    }
    
    }

//extension StarWarsVM {
//    static let test = StarWarsVM(network: DataTest())
//}


extension StarWarsVM {
    static let test = StarWarsVM(network: DataTest())
}


extension People {
    static let test1 = People(name: "Luke Skywalker",
                             height: "172",
                             mass: "77",
                             hairColor: "Blond",
                             skinColor: "Fair",
                             eyeColor: "Blond",
                             birthYear: "19 BBY",
                             gender: "Male",
                             homeworld: "https://swapi.dev/api/planets/1/",
                             films: ["https://swapi.dev/api/films/1/",
                                     "https://swapi.dev/api/films/2/",
                                     "https://swapi.dev/api/films/3/",
                                     "https://swapi.dev/api/films/6/"],
                             species: [],
                             vehicles: ["https://swapi.dev/api/vehicles/14/",
                                        "https://swapi.dev/api/vehicles/30/"],
                             starships: ["https://swapi.dev/api/starships/12/",
                                         "https://swapi.dev/api/starships/22/"],
                             created: "2014-12-09T13:50:51.644000Z",
                             edited: "2014-12-20T21:17:56.891000Z",
                             url: "https://swapi.dev/api/people/1/")
}

extension Specie {
    static let test2 = Specie(name: "Human",
                             classification: "mammal",
                             designation: .sentient,
                             averageHeight: "180",
                             skinColors: "caucasian, black, asian, hispanic",
                             hairColors: "blonde, brown, black, red",
                             eyeColors: "brown, blue, green, hazel, grey, amber",
                             averageLifespan: "120",
                             homeworld: "https://swapi.dev/api/planets/9/",
                             language: "Galactic Basic",
                             people: [
                                "https://swapi.dev/api/people/66/",
                                "https://swapi.dev/api/people/67/",
                                "https://swapi.dev/api/people/68/",
                                "https://swapi.dev/api/people/74/"
                            ],
                             films: [
                                "https://swapi.dev/api/films/1/",
                                "https://swapi.dev/api/films/2/",
                                "https://swapi.dev/api/films/3/",
                                "https://swapi.dev/api/films/4/",
                                "https://swapi.dev/api/films/5/",
                                "https://swapi.dev/api/films/6/"
                            ],
                             created: "2014-12-10T13:52:11.567000Z",
                             edited: "2014-12-20T21:36:42.136000Z",
                             url: "https://swapi.dev/api/species/1/")
}


//extension SpeciesVM{
//    static let test2 = SpeciesVM(network: DataTest())
//}

extension Planet {
    static let test3 = Planet(name: "Tatooine",
                              rotationPeriod: "23",
                              orbitalPeriod: "304",
                              diameter: "10465",
                              climate: "arid",
                              gravity: "1 standard",
                              terrain: "desert",
                              surfaceWater: "1",
                              population: "200000",
                              residents: [
                                "https://swapi.dev/api/people/1/",
                                "https://swapi.dev/api/people/2/",
                                "https://swapi.dev/api/people/4/",
                                "https://swapi.dev/api/people/6/",
                                "https://swapi.dev/api/people/7/",
                                "https://swapi.dev/api/people/8/",
                                "https://swapi.dev/api/people/9/",
                                "https://swapi.dev/api/people/11/",
                                "https://swapi.dev/api/people/43/",
                                "https://swapi.dev/api/people/62/"
                            ],
                              films: [
                                "https://swapi.dev/api/films/1/",
                                "https://swapi.dev/api/films/3/",
                                "https://swapi.dev/api/films/4/",
                                "https://swapi.dev/api/films/5/",
                                "https://swapi.dev/api/films/6/"
                            ],
                              created: "2014-12-09T13:50:49.641000Z",
                              edited: "2014-12-20T20:58:18.411000Z",
                              url: "https://swapi.dev/api/planets/1/")
}

//extension PlanetsVM {
//    static let test3 = PlanetsVM(network: DataTest())
//}

extension Vehicles {
    static let test4 = Vehicles(name: "Sand Crawler",
                                model: "Digger Crawler",
                                manufacturer: "Corellia Mining Corporation",
                                costInCredits: "150000",
                                length: "36.8",
                                maxAtmospheringSpeed: "30",
                                crew: "46",
                                passengers: "30",
                                cargoCapacity: "50000",
                                consumables: "2 months",
                                vehicleClass: "wheeled",
                                pilots: [],
                                films: [
                                    "https://swapi.dev/api/films/1/",
                                    "https://swapi.dev/api/films/5/"
                                ],
                                created: "2014-12-10T15:36:25.724000Z",
                                edited: "2014-12-20T21:30:21.661000Z",
                                url: "https://swapi.dev/api/vehicles/4/")
}

//extension VehiclesVM {
//    static let test4 = VehiclesVM(network: DataTest())
//}

extension Starship {
    static let test5 = Starship(name: "CR90 corvette",
                                model: "CR90 corvette",
                                manufacturer: "Corellian Engineering Corporation",
                                costInCredits: "3500000",
                                length: "150",
                                maxAtmospheringSpeed: "950",
                                crew: "30-165",
                                passengers: "600",
                                cargoCapacity: "3000000",
                                consumables: "1 year",
                                hyperdriveRating: "2.0",
                                mglt: "60",
                                starshipClass: "corvette",
                                pilots: [],
                                films: [
                                    "https://swapi.dev/api/films/1/",
                                    "https://swapi.dev/api/films/3/",
                                    "https://swapi.dev/api/films/6/"
                                ],
                                created: "2014-12-10T14:20:33.369000Z",
                                edited: "2014-12-20T21:23:49.867000Z",
                                url: "https://swapi.dev/api/starships/2/")
}

//extension StarshipVM{
//    static let test5 = StarshipVM(network: DataTest())
//}
//
//extension FilmsVM {
//    static let test6 = FilmsVM(network: DataTest())
//}

extension Films {
    static let test6 = Films(title: "A New Hope",
                             episodeID: 4,
                             openingCrawl: "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....",
                             director: "George Lucas",
                             producer: "Gary Kurtz, Rick McCallum",
                             releaseDate: "1977-05-25",
                             characters: [
                                "https://swapi.dev/api/people/1/",
                                "https://swapi.dev/api/people/2/",
                                "https://swapi.dev/api/people/3/",
                                "https://swapi.dev/api/people/4/",
                                "https://swapi.dev/api/people/5/",
                                "https://swapi.dev/api/people/6/",
                                "https://swapi.dev/api/people/7/",
                                "https://swapi.dev/api/people/8/",
                                "https://swapi.dev/api/people/9/",
                                "https://swapi.dev/api/people/10/",
                                "https://swapi.dev/api/people/12/",
                                "https://swapi.dev/api/people/13/",
                                "https://swapi.dev/api/people/14/",
                                "https://swapi.dev/api/people/15/",
                                "https://swapi.dev/api/people/16/",
                                "https://swapi.dev/api/people/18/",
                                "https://swapi.dev/api/people/19/",
                                "https://swapi.dev/api/people/81/"
                            ],
                             planets: [
                                "https://swapi.dev/api/planets/1/",
                                "https://swapi.dev/api/planets/2/",
                                "https://swapi.dev/api/planets/3/"
                            ],
                             starships: [
                                "https://swapi.dev/api/starships/2/",
                                "https://swapi.dev/api/starships/3/",
                                "https://swapi.dev/api/starships/5/",
                                "https://swapi.dev/api/starships/9/",
                                "https://swapi.dev/api/starships/10/",
                                "https://swapi.dev/api/starships/11/",
                                "https://swapi.dev/api/starships/12/",
                                "https://swapi.dev/api/starships/13/"
                            ],
                             vehicles: [
                                "https://swapi.dev/api/vehicles/4/",
                                "https://swapi.dev/api/vehicles/6/",
                                "https://swapi.dev/api/vehicles/7/",
                                "https://swapi.dev/api/vehicles/8/"
                            ],
                             species: [
                                "https://swapi.dev/api/species/1/",
                                "https://swapi.dev/api/species/2/",
                                "https://swapi.dev/api/species/3/",
                                "https://swapi.dev/api/species/4/",
                                "https://swapi.dev/api/species/5/"
                            ],
                             created: "2014-12-10T14:23:31.880000Z",
                             edited: "2014-12-20T19:49:45.256000Z",
                             url: "https://swapi.dev/api/films/1/")
}
