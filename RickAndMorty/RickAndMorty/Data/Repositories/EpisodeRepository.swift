import Foundation

protocol EpisodeRepositoryType {
    func getEpisode(url: String) async throws -> Episode
}

final class EpisodeRepository: EpisodeRepositoryType {
    private var apiDataSource: EpisodeApiDataSourceType
    private var domainMapper: EpisodeDomainMapper

    init(
        apiDataSource: EpisodeApiDataSourceType,
        domainMapper: EpisodeDomainMapper
    ) {
        self.apiDataSource = apiDataSource
        self.domainMapper = domainMapper
    }
    
    func getEpisode(url: String) async throws -> Episode {
        let episode = try await apiDataSource.getEpisode(url: url)
        
        return domainMapper.map(episode: episode)
    }
}
