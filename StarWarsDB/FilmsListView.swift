//
//  FilmsListView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct FilmsListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedFilm: Films?
    var body: some View {
        List(vm.films, id: \.self) { film in
                   Button(film.title) {
                       selectedFilm = film
                   }
                   .tint(.primary)
               }
               .sheet(item: $selectedFilm) { film in
                   FilmsProfileView(film: film) 
               }
               .navigationTitle("Films")
               .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FilmsListView()
            .environmentObject(StarWarsVM.test)
    }
}
