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
    
    func makeRequest(
        endpoint: Endpoint,
        baseUrl: String
    ) async -> Result<Data, HTTPClientError> {
        let url = requestMaquer.url(endpoint: endpoint, baseUrl: baseUrl)
        
        guard let url = url else {
            return .failure(.badURL)
        }
        
        guard let result = try? await session.data(from: url) else {
            return .failure(.genericError)
        }
        
        guard let response = result.1 as? HTTPURLResponse else {
            return .failure(.responseError)
        }
        
        guard response.statusCode == 200 else {
            let error = errorResolver.resolve(statusCode: response.statusCode)
            return .failure(error)
        }
        
        return .success(result.0)
    }
}
