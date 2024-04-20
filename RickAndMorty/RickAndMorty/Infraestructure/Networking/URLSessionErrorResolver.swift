import Foundation

final class URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode < 500 else {
            return .serverError
        }
        return .clientError
    }
}
