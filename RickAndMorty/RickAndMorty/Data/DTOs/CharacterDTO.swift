import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let location: Location
    let image: String
    
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    
    struct Location: Decodable {
        let name: String
    }
}

extension CharacterDTO {
    var characterStatus: CharacterStatus {
        switch self.status {
        case .alive:
            return .alive
        case .dead:
            return .dead
        case .unknown:
            return .unknown
        }
    }
}
