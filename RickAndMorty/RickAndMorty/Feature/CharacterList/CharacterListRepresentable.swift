import SwiftUI

struct CharacterListRepresentable: Identifiable {
    let id: Int
    let name: String
    let statusAndSpecie: String
    let statusColor: Color
    let lastKnownLocation: String
    let image: URL?
    
    init(domainModel: Character) {
        self.id = domainModel.id
        self.name = domainModel.name
        self.statusAndSpecie = domainModel.status.rawValue.capitalized + " - " + domainModel.species
        self.statusColor = domainModel.status.color
        self.lastKnownLocation = domainModel.lastKnownLocation
        self.image = domainModel.image
    }
}

extension CharacterStatus {
    var color: Color {
        switch self {
        case .alive: .green
        case .dead: .red
        case .unknown: .gray
        }
    }
}
