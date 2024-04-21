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
    
    func makeRequest(endpoint: Endpoint, baseUrl: String) async throws -> Data {
        let url = requestMaquer.url(endpoint: endpoint, baseUrl: baseUrl)
        
        guard let url = url else {
            throw HTTPClientError.badURL
        }
        
        let request = URLRequest(url: url)
        
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
