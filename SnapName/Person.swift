//
//  Person.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    var picture: Image
    var name: String
    var id: UUID
}

class People {
    var people: [Person] = []
    
    init() {
        self.people = [
            Person(picture: Image("example"), name: "Example Bella", id: UUID())
        ]
    }
}
