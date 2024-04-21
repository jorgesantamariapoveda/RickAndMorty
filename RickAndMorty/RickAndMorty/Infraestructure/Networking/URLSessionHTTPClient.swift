import Foundation

final class URLSessionHTTPClient: HTTPClientType {
    private let session: URLSession
    private let requestMaquer: URLSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver
    
    init(
        session: URLSession = .shared,
        requestMaquer: URLSessionRequestMaker,
        errorResolver: URLSessionErrorResolver
    ) {
        self.session = session
        self.requestMaquer = requestMaquer
        self.errorResolver = errorResolver
    }
    
    func makeRequest(baseUrl: String, path: String, method: HTTPMethod) async throws -> Data {
        let url = requestMaquer.url(baseUrl: baseUrl, path: path)
        
        return try await execute(url: url, method: method)
    }
    
    func makeRequest(url: String, method: HTTPMethod) async throws -> Data {
        let url = URL(string: url)
        
        return try await execute(url: url, method: method)
    }
    
    private func execute(url: URL?, method: HTTPMethod) async throws -> Data {
        guard let url = url else {
            throw HTTPClientError.badURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        guard let (data, response) = try? await session.data(for: request) else {
            throw HTTPClientError.genericError
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw HTTPClientError.responseError
        }
        
        guard response.statusCode == 200 else {
            throw errorResolver.resolve(statusCode: response.statusCode)
        }
        
        return data
    }
}
