import Foundation

protocol GetEpisodeUseCaseType {
    func execute(url: String) async throws -> Episode
}
    
final class GetEpisodeUseCase: GetEpisodeUseCaseType {
    private let repository: EpisodeRepositoryType
    
    init(repository: EpisodeRepositoryType) {
        self.repository = repository
    }
    
    func execute(url: String) async throws -> Episode {
        try await repository.getEpisode(url: url)
    }
}
