import Foundation

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let lastKnownLocation: String
    let episodeList: [String]
    let image: URL?
}

enum CharacterStatus: String {
    case alive
    case dead
    case unknown
}
