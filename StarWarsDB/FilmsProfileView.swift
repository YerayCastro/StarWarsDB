//
//  FilmsProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct FilmsProfileView: View {
    let film: Films
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent("Director", value: film.director)
                    LabeledContent("Producer", value: film.producer)
                    LabeledContent("Release Date", value: film.releaseDate)
                    LabeledContent("Created", value: film.created)
                    LabeledContent("Edited", value: film.edited)
                    LabeledContent("Url", value: film.url)
                } header: {
                    Text("personal Data")
                }
                Section {
                    LabeledContent("Opening", value: film.openingCrawl)
                        .lineLimit(10)
                } header: {
                    Text("Opening Crawl")
                }
                Section {
                    LabeledContent("Characters", value: "\(film.characters)")
                    LabeledContent("Species", value: "\(film.species)")
                    LabeledContent("Planets", value: "\(film.planets)")
                    LabeledContent("Vehicles", value: "\(film.vehicles)")
                    LabeledContent("Starships", value: "\(film.starships)")
                } header: {
                    Text("Paricipation Data")
                }
                
            }
            .navigationTitle("\(film.title) Episode \(film.episodeID)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        FilmsProfileView(film: .test6)
    }
}


