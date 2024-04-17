//
//  PlanetProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct PlanetProfileView: View {
    let planet: Planet
    var body: some View {
        Form {
            Section {
                LabeledContent("Name", value: planet.name)
                LabeledContent("Terrain", value: planet.terrain)
                LabeledContent("Climate", value: planet.climate)
                LabeledContent("Diameter", value: planet.diameter)
                LabeledContent("Gravity", value: planet.gravity)
                LabeledContent("Rotation Period", value: planet.rotationPeriod)
                LabeledContent("Orbital Period", value: planet.orbitalPeriod)
                LabeledContent("Surface Water", value: planet.surfaceWater)
                LabeledContent("Population", value: planet.population)
                LabeledContent("Residents", value: "\(planet.residentsDescription)")
            } header: {
                Text("Personal Data")
            }
            Section {
                LabeledContent("films", value: "\(planet.films ?? [])")
                LabeledContent("Url", value: planet.url)
                LabeledContent("Created", value: planet.created)
                LabeledContent("Edited", value: planet.edited)
            } header: {
                Text("Films Data")
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        PlanetProfileView(planet: .test3)
    }
}

