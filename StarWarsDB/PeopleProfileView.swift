//
//  PeopleProfileView.swift
//  StarWarsDB
//
//  Created by Yery Castro on 3/4/24.
//

import SwiftUI

struct PeopleProfileView: View {
    let people: People
    
    
    var body: some View {
        Form {
            Section {
                LabeledContent("Name", value: people.name)
                LabeledContent("Species", value: people.speciesDescription)
                LabeledContent("Gender", value: people.gender)
                LabeledContent("Birth Year", value: people.birthYear)
                LabeledContent("Homeworld", value: people.homeworld)
            } header: {
                Text("Personal Data")
            }
            Section {
                LabeledContent("Height", value: people.height)
                LabeledContent("Mass", value: people.mass)
                LabeledContent("Skin Color", value: people.skinColor)
                LabeledContent("Hair Color", value: people.hairColor)
                LabeledContent("Eye Color", value: people.eyeColor)
            } header: {
                Text("Characteristics Data")
            }
            Section {
                LabeledContent("Films", value: "\(people.films)")
                LabeledContent("Url", value: people.url)
                LabeledContent("Created", value: people.created)
                LabeledContent("Edited", value: people.edited)
            } header: {
                Text("Films Data")
            }
        }
    }
}

#Preview {
        NavigationStack{
            PeopleProfileView(people: .test1)
                
        }
}


