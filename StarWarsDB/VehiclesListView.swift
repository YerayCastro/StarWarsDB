//
//  VehiclesListView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 4/4/24.
//

import SwiftUI

struct VehiclesListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedVehicle: Vehicles?
    var body: some View {
        List(vm.vehicles, id: \.self) { vehicle in
            Button(vehicle.name) {
                selectedVehicle = vehicle
            }
            .onAppear {
                if vehicle == vm.vehicles.last {
                    Task {
                        await vm.fetchVehicle()
                    }
                }
            }
            .tint(.primary)
        }
        .sheet(item: $selectedVehicle) { vehicle in
            VehiclesProfileView(vehicle: vehicle)
        }
        .navigationTitle("Vehicles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
     NavigationStack {
        VehiclesListView()
            .environmentObject(StarWarsVM.test)
    }
}


