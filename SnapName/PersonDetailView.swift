//
//  PersonDetailView.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    var body: some View {
        VStack {
            if let image = loadImage(for: person) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Image not available")
            }
            Text(person.name)
                .font(.title)
                .padding()
        }
    }
    func loadImage(for person: Person) -> UIImage? {
        let imageURL = URL.documentsDirectory.appendingPathComponent(person.imagePath)
        return UIImage(contentsOfFile: imageURL.path)
    }
}

#Preview {
    PersonDetailView(person: People().people[0])
}
