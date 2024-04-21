import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let location: Location
    let image: String
    let episodeList: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case location
        case image
        case episodeList = "episode"
    }
    
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
