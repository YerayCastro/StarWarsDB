//
//  StarshipsProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct StarshipsProfileView: View {
    let starship: Starship
    
    var body: some View {
        Form {
            Section {
                LabeledContent("Name", value: starship.name)
                LabeledContent("Manufacturer", value: starship.manufacturer)
                LabeledContent("Starship Class", value: starship.starshipClass)
                LabeledContent("Model", value: starship.model)
                LabeledContent("Cost in Credit", value: starship.costInCredits)
            } header: {
                Text("Personal Data")
            }
            Section {
                LabeledContent("Cargo Capacity", value: starship.cargoCapacity)
                LabeledContent("Crew", value: starship.crew)
                LabeledContent("Pilots", value: starship.starshipDescription)
                LabeledContent("Passengers", value: starship.passengers)
                LabeledContent("Length", value: starship.length)
                LabeledContent("Max Atmosphering Speed ", value: starship.maxAtmospheringSpeed)
                LabeledContent("Hyperdrive Rating", value: starship.hyperdriveRating)
                LabeledContent("Consumables", value: starship.consumables)
                LabeledContent("Mglt", value: starship.mglt)
            } header: {
                Text("Characteristics Data")
            }
            Section {
                LabeledContent("Films", value: "\(starship.films)")
                LabeledContent("Url", value: starship.url)
                LabeledContent("Created", value: starship.created)
                LabeledContent("Edited", value: starship.edited)
            } header: {
                Text("Films")
            }
        }
    }
}

#Preview {
    NavigationStack {
        StarshipsProfileView(starship: .test5)
    }
}
