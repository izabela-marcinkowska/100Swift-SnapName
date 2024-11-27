//
//  ContentView.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import SwiftUI

struct ContentView: View {
    var peopleToKnow = People()
    var body: some View {
        VStack {
            List(peopleToKnow.people) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
