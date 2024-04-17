//
//  SpeciesProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 3/4/24.
//

import SwiftUI

struct SpeciesProfileView: View {
    @EnvironmentObject var vm: StarWarsVM
    let specie: Specie
    @State private var homeworldName: String = ""
    
    var body: some View {
        Form {
            Section {
                LabeledContent("Name", value: specie.name)
                LabeledContent("Clasification", value: specie.classification)
                LabeledContent("Designation", value: specie.designation.rawValue)
                LabeledContent("Languaje", value: specie.language)
                LabeledContent("Homeworld", value: vm.homeworldName)
                    .onAppear {
                        Task {
                            await vm.fetchHomeworldName(from: specie.homeworld ?? "")
                        }
                    }
            } header: {
                Text("Personal Data")
            }
            Section {
                LabeledContent("Average Life Span", value: specie.averageLifespan)
                LabeledContent("Average Height", value: specie.averageHeight)
                LabeledContent("Skin Color", value: specie.skinColors)
                LabeledContent("Hair color", value: specie.hairColors)
                LabeledContent("Eye Color", value: specie.eyeColors)
            } header: {
                Text("Characteristics Data")
            }
            Section {
                LabeledContent("Films", value: "\(specie.films)")
                LabeledContent("Url", value: specie.url)
                LabeledContent("Created", value: specie.created)
                LabeledContent("Edited", value: specie.edited)
                LabeledContent("People", value: "\(specie.people)")
            } header: {
                Text("Films Data")
            }
        }
        
    }
    func fetchHomeworldName(from url: String) async -> String {
        guard let url = URL(string: url) else { return "Desconocido" }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let planet = try JSONDecoder().decode(Planet.self, from: data)
            return planet.name
        } catch {
            print("Error al cargar el homeworld: \(error)")
            return "Desconocido"
        }
    }
}

#Preview {
    NavigationStack {
        SpeciesProfileView(specie: .test2)
            .environmentObject(StarWarsVM.test)
    }
}

