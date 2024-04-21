import Foundation

final class CharacterDetailFactory {
    static func create(character: Character) -> CharacterDetailView {
        CharacterDetailView(
            viewModel: createViewModel(character: character)
        )
    }
    
    private static func createViewModel(character: Character) -> CharacterDetailViewModel {
        CharacterDetailViewModel(
            character: character,
            getEpisodeUseCase: createGetEpisodeUseCase()
        )
    }
    
    private static func createGetEpisodeUseCase() -> GetEpisodeUseCaseType {
        GetEpisodeUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> EpisodeRepositoryType {
        EpisodeRepository(
            apiDataSource: createApiDataSource(),
            domainMapper: EpisodeDomainMapper())
    }
    
    private static func createApiDataSource() -> EpisodeApiDataSourceType {
        EpisodeApiDataSource(httpClient: createHttpClient())
    }
    
    private static func createHttpClient() -> HTTPClientType {
        URLSessionHTTPClient(
            requestMaquer: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver()
        )
    }
}
