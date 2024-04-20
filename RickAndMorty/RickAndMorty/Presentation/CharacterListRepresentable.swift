import Foundation

struct CharacterListRepresentable: Identifiable {
    let id: Int
    let name: String
    let statusAndSpecie: String
    let lastKnownLocation: String
    
    init(domainModel: Character) {
        self.id = domainModel.id
        self.name = domainModel.name
        self.statusAndSpecie = domainModel.status + " - " + domainModel.species
        self.lastKnownLocation = domainModel.lastKnownLocation
    }
}
