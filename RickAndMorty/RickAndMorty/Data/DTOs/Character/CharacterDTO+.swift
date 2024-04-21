import Foundation

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
