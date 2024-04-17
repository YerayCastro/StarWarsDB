//
//  VehiclesProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct VehiclesProfileView: View {
    let vehicle: Vehicles
    var body: some View {
        Form {
            Section {
                LabeledContent("Name", value: vehicle.name)
                LabeledContent("Manufacturer", value: vehicle.manufacturer)
                LabeledContent("Vehicle Class", value: vehicle.vehicleClass)
                LabeledContent("Model", value: vehicle.model)
                LabeledContent("Cost in Credit", value: vehicle.costInCredits)
            } header: {
                Text("Personal Data")
            }
            Section {
                LabeledContent("Cargo Capacity", value: vehicle.cargoCapacity)
                LabeledContent("Crew", value: vehicle.crew)
                LabeledContent("Pilots", value: vehicle.pilotsDescription)
                LabeledContent("Passengers", value: vehicle.passengers)
                LabeledContent("Length", value: vehicle.length)
                LabeledContent("Max Atmosphering Speed ", value: vehicle.maxAtmospheringSpeed)
                LabeledContent("Consumables", value: vehicle.consumables)
            } header: {
                Text("Characteristics Data")
            }
            Section {
                LabeledContent("Films", value: "\(vehicle.films)")
                LabeledContent("Url", value: vehicle.url)
                LabeledContent("Created", value: vehicle.created)
                LabeledContent("Edited", value: vehicle.edited)
            } header: {
                Text("Films")
            }
        }
    }
}

#Preview {
    NavigationStack {
        VehiclesProfileView(vehicle: .test4)
    }
}
