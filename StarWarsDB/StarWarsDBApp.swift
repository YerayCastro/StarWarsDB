//
//  StarWarsDBApp.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import SwiftUI

@main
struct StarWarsDBApp: App {
//    @StateObject var vm = PeopleVM()
//    @StateObject var vm2 = SpeciesVM()
//    @StateObject var vm3 = PlanetsVM()
//    @StateObject var vm4 = VehiclesVM()
//    @StateObject var vm5 = StarshipVM()
//    @StateObject var vm6 = FilmsVM()
    @StateObject var vm = StarWarsVM()
    var body: some Scene {
        WindowGroup {
            StarWarsView()
        }
        .environmentObject(vm)
//        .environmentObject(vm)
//        .environmentObject(vm2)
//        .environmentObject(vm3)
//        .environmentObject(vm4)
//        .environmentObject(vm5)
//        .environmentObject(vm6)
    }
}
