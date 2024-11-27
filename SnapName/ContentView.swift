//
//  ContentView.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var people = People()
    @State private var showingPhotoPicker = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var inputImage: UIImage?
    @State private var showingNamePrompt = false
    @State private var newPersonName = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people.people) { person in
                    NavigationLink(destination: PersonDetailView(person: person)) {
                        Text(person.name)
                    }
                }
            }
            .navigationTitle("People")

        }
    }
}

#Preview {
    ContentView()
}
