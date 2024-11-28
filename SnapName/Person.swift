//
//  Person.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import Foundation
import SwiftUI

extension URL {
    static var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}

struct Person: Identifiable, Codable {
    var imagePath: String
    var name: String
    var id: UUID
}

class People: ObservableObject {
    @Published var people: [Person] = []
    let savePath = URL.documentsDirectory.appendingPathComponent("people.json")

    
    init() {
        loadPeople()
    }
    
    func addPerson(_ person: Person) {
        people.append(person)
        savePeople()
    }
    
    func savePeople() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath)
        } catch {
            print("Failed to save people: \(error.localizedDescription)")
        }
    }
    
    func loadPeople() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
}
