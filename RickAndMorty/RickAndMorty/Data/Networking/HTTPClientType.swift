import Foundation

protocol HTTPClientType {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async throws -> Data
}
