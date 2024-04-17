//
//  PlanetsListView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct PlanetsListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedPlanet: Planet?
    var body: some View {
        List(vm.planets, id: \.self) { planet in
            Button(planet.name) {
                selectedPlanet = planet
            }
            .onAppear {
                if planet == vm.planets.last {
                    Task {
                        await vm.fetchPlanet()
                    }
                }
            }
            .tint(.primary)
        }
        .sheet(item: $selectedPlanet) { planet in
            PlanetProfileView(planet: planet)
        }
        .navigationTitle("Species")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
     NavigationStack {
        PlanetsListView()
            .environmentObject(StarWarsVM.test)
    }
}

