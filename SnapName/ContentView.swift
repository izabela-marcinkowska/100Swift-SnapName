//
//  ContentView.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import SwiftUI

struct ContentView: View {
    var PeopleToKnow = People()
    var body: some View {
        VStack {
            List(PeopleToKnow.people) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
