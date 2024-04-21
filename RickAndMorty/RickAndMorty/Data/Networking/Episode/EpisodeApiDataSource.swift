import Foundation

protocol EpisodeApiDataSourceType {
    func getEpisode(url: String) async throws -> EpisodeDTO
}

final class EpisodeApiDataSource: EpisodeApiDataSourceType {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getEpisode(url: String) async throws -> EpisodeDTO {
        let data = try await httpClient.makeRequest(url: url, method: .get)
        
        guard let result = try? JSONDecoder().decode(EpisodeDTO.self, from: data) else {
            throw HTTPClientError.parsingError
        }
        
        return result
    }
}
