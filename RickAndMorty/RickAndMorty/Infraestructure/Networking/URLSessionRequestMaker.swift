import Foundation

final class URLSessionRequestMaker {
    func url(baseUrl: String, path: String) -> URL? {
        let urlComponents = URLComponents(string: baseUrl + path)
        return urlComponents?.url
    }
}
