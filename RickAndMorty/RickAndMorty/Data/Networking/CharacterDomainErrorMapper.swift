import Foundation

final class CharacterDomainErrorMapper {
    func map(error: HTTPClientError) -> CharacterDomainError {
        //!! Review 🔴
        switch error {
        case .clientError:
            return .generic
        case .serverError:
            return .generic
        case .parsingError:
            return .generic
        case .badURL:
            return .generic
        case .responseError:
            return .generic
        case .genericError:
            return .generic
        }
    }
}
