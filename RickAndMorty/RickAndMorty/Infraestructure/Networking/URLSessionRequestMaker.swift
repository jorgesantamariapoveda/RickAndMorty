import Foundation

final class URLSessionRequestMaker {
    func url(endpoint: Endpoint, baseUrl: String) -> URL? {
        let urlComponents = URLComponents(string: baseUrl + endpoint.path)
        return urlComponents?.url
    }
}
