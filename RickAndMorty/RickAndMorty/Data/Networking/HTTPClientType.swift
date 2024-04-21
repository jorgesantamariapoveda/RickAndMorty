import Foundation

protocol HTTPClientType {
    func makeRequest(baseUrl: String, path: String, method: HTTPMethod) async throws -> Data
    func makeRequest(url: String, method: HTTPMethod) async throws -> Data
}
