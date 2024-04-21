import Foundation

struct Character {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let lastKnownLocation: String
    let firstSeenIn: String
    let image: URL?
}

enum CharacterStatus: String {
    case alive
    case dead
    case unknown
}
