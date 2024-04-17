//
//  StarWarsView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct StarWarsView: View {
    @EnvironmentObject var vm: StarWarsVM
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("Show Films", destination: FilmsListView(vm: _vm))
                } header: {
                    Text("Films")
                }
                Section {
                    NavigationLink("Show People", destination: PeopleListView(vm: _vm))
                } header: {
                    Text("Peoples")
                }
                Section {
                    NavigationLink("Show Species", destination: SpeciesListView(vm: _vm))
                } header: {
                    Text("Species")
                }
                Section {
                    NavigationLink("Show Planets", destination: PlanetsListView(vm: _vm))
                } header: {
                    Text("Planets")
                }
                Section {
                    NavigationLink("Show Vehicles", destination: VehiclesListView(vm: _vm))
                } header: {
                    Text("Vehicles")
                }
                Section {
                    NavigationLink("Show Starships", destination: StarshipsListView(vm: _vm))
                } header: {
                    Text("Starships")
                }
            }
            .navigationTitle("Star Wars DB")
        }
    }
}

#Preview {
    StarWarsView()
        .environmentObject(StarWarsVM.test)
        
}


