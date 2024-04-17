//
//  StarshipsListView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct StarshipsListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedStarship: Starship?
    var body: some View {
        List(vm.starships, id: \.self) { starship in
            Button(starship.name) {
                selectedStarship = starship 
            }
            .onAppear {
                if starship == vm.starships.last {
                    Task {
                        await vm.fetchStarship()
                    }
                }
            }
            .tint(.primary)
        }
        .sheet(item: $selectedStarship) { starship in
            StarshipsProfileView(starship: starship)
        }
        .navigationTitle("Starships")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
     NavigationStack {
        StarshipsListView()
            .environmentObject(StarWarsVM.test)
    }
}

