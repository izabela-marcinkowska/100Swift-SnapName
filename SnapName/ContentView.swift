//
//  ContentView.swift
//  SnapName
//
//  Created by Izabela Marcinkowska on 2024-11-27.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject var people = People()
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
            .toolbar {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName: "plus")
                }
            }
            .onChange(of: selectedItem) {
                loadImage()
            }
            .alert("Enter Name", isPresented: $showingNamePrompt) {
                TextField("Name", text: $newPersonName)
                Button("Add") {
                    if let image = inputImage {
                        addNewPerson(image: image, name: newPersonName)
                    }
                    clearSelection()
                }
                Button("Cancel", role: .cancel) {
                    clearSelection()
                }
            }
        }
    }

    func clearSelection() {
        newPersonName = ""
        inputImage = nil
        selectedItem = nil
    }

    func loadImage() {
        Task {
            guard let item = selectedItem else { return }
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                inputImage = uiImage
                showingNamePrompt = true
            }
        }
    }

    func addNewPerson(image: UIImage, name: String) {
        guard let imagePath = saveImage(image) else { return }
        let person = Person(imagePath: imagePath, name: name, id: UUID())
        people.addPerson(person)
    }

    func saveImage(_ image: UIImage) -> String? {
        let imageName = UUID().uuidString
        let imageURL = URL.documentsDirectory.appendingPathComponent(imageName)

        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }

        do {
            try data.write(to: imageURL, options: [.atomic, .completeFileProtection])
            return imageName
        } catch {
            print("Unable to save image to disk: \(error.localizedDescription)")
            return nil
        }
    }
}

#Preview {
    ContentView()
}

