import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case badURL
    case responseError
    case genericError
}
