//
//  PeopleView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 2/4/24.
//

import SwiftUI

struct PeopleListView: View {
    @EnvironmentObject var vm: StarWarsVM
    @State private var selectedPeople: People?
    
    
    var body: some View {
        List(vm.peoples, id: \.self) { people in
            Button(people.name) {
                selectedPeople = people
            }
            .onAppear {
                if people == vm.peoples.last {
                    Task {
                        await vm.fetchPeople()
                    }
                }
            }
            .tint(.primary)
        }
        .sheet(item: $selectedPeople) { people in
            PeopleProfileView(people: people) 
        }
        .navigationTitle("Peoples")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationStack{
        PeopleListView()
            .environmentObject(StarWarsVM.test)
    }
        
}



//List(vm.peoples, id: \.self) { people in
//    Button(people.name) {
//        selectedPeople = people // Esto es correcto si vm.selectedFilm existe y está bien definido en tu ViewModel
//    }
//    .onAppear {
//        if people == vm.peoples.last { // Comprueba si este es el último ítem
//            Task {
//                await vm.fetchPeople()
//            }
//        }
//    }
//    
//    .tint(.primary)
//}
//.sheet(item: $selectedPeople) { people in
//    PeopleProfileView(people: people)
//    // Asegúrate de que PeliculaDetail acepta un argumento `film` de tipo `Films`
//}
//.navigationTitle("Peoples")
