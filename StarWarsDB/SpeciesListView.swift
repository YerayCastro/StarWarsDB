//
//  SpeciesListView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 3/4/24.
//

import SwiftUI

struct SpeciesListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedSpecie: Specie?
    
    var body: some View {
        List(vm.species, id: \.self) { specie in
            Button(specie.name) {
                selectedSpecie = specie
            }
            .onAppear {
                if specie == vm.species.last {
                    Task {
                        await vm.fetchSpecie()
                    }
                }
            }
            .tint(.primary)
        }
        .sheet(item: $selectedSpecie) { specie in
            SpeciesProfileView(specie: specie)
        }
        .navigationTitle("Species")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        SpeciesListView()
            .environmentObject(StarWarsVM.test)
    }
        
        
}

