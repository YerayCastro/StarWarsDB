//
//  StarWarsVM.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import Foundation

final class StarWarsVM: ObservableObject {
    let network: DataInteractor
    
    @Published var peoples: [People] = []
    @Published var species: [Specie] = []
    @Published var planets: [Planet] = []
    @Published var vehicles: [Vehicles] = []
    @Published var starships: [Starship] = []
    @Published var films: [Films] = []
    
    @Published var nextPageURL1: URL? = URL(string: "https://swapi.dev/api/people")
    @Published var nextPageURL2: URL? = URL(string: "https://swapi.dev/api/species")
    @Published var nextPageURL3: URL? = URL(string: "https://swapi.dev/api/planets")
    @Published var nextPageURL4: URL? = URL(string: "https://swapi.dev/api/vehicles")
    @Published var nextPageURL5: URL? = URL(string: "https://swapi.dev/api/starships")
    @Published var nextPageURL6: URL? = URL(string: "https://swapi.dev/api/films")
    
    @Published var homeworldName: String = ""
    
    
    
    init(network: DataInteractor = Network()) {
        self.network = network
        Task { 
            await fetchFilms()
            await fetchPeople()
            await fetchSpecie()
            await fetchPlanet()
            await fetchVehicle()
            await fetchStarship()
        }
    }
    
        func fetchPeople() async {
            guard let url = nextPageURL1 else { return }
    
            do {
                let (newPeople, nextPage1) = try await network.getPeople(from: url)
                await MainActor.run {
                    self.peoples.append(contentsOf: newPeople)
                    self.nextPageURL1 = nextPage1
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
    
        func fetchSpecie() async {
            guard let url = nextPageURL2 else { return }
    
            do {
                let (newSpecie, nextPage2) = try await network.getSpecie(from: url)
                await MainActor.run {
                    self.species.append(contentsOf: newSpecie)
                    self.nextPageURL2 = nextPage2
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
    
        func fetchPlanet() async {
            guard let url = nextPageURL3 else { return }
    
            do {
                let (newPlanet, nextPage3) = try await network.getPlanet(from: url)
                await MainActor.run {
                    self.planets.append(contentsOf: newPlanet)
                    self.nextPageURL3 = nextPage3
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
    
        func fetchVehicle() async {
            guard let url = nextPageURL4 else { return }
    
            do {
                let (newVehicle, nextPage4) = try await network.getVehicle(from: url)
                await MainActor.run {
                    self.vehicles.append(contentsOf: newVehicle)
                    self.nextPageURL4 = nextPage4
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
        
        func fetchStarship() async {
            guard let url = nextPageURL5 else { return }
    
            do {
                let (newStarShip, nextPage5) = try await network.getStarship(from: url)
                await MainActor.run {
                    self.starships.append(contentsOf: newStarShip)
                    self.nextPageURL5 = nextPage5
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
    
        func fetchFilms() async {
            guard let url = nextPageURL6 else { return }
    
            do {
                let (newFilm, nextPage6) = try await network.getFilms(from: url)
                await MainActor.run {
                    self.films.append(contentsOf: newFilm)
                    self.nextPageURL6 = nextPage6
                }
            } catch {
                print("Error fetching people: \(error.localizedDescription)")
            }
        }
    
    
    func fetchHomeworldName(from urlString: String) async {
           guard let url = URL(string: urlString) else {
               print("Invalid URL")
               return
           }

           var request = URLRequest(url: url)
           request.httpMethod = "GET" 

           do {
               let (data, response) = try await URLSession.shared.data(for: request)

               guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                   print("Error: Invalid response")
                   return
               }

               let decoder = JSONDecoder()
               let planet = try decoder.decode(Planet.self, from: data)
               self.homeworldName = planet.name
           } catch {
               print("Fetch failed: \(error.localizedDescription)")
           }
       }
        
    
    
}
