
final class CharacterListFactory {
    static func create() -> CharacterListView {
        CharacterListView(
            viewModel: createViewModel()
        )
    }
    
    private static func createViewModel() -> CharacterListViewModel {
        CharacterListViewModel(
            getCharacterListUseCase: createGetCharacterListUseCase()
        )
    }
    
    private static func createGetCharacterListUseCase() -> GetCharacterListUseCaseType {
        GetCharacterListUseCase(
            repository: createRepository()
        )
    }
    
    private static func createRepository() -> CharacterListRepositoryType {
        CharacterRepository(
            apiDataSource: createApiDataSource(),
            domainMapper: CharacterDomainMapper(),
            domainErrorMapper: CharacterDomainErrorMapper()
        )
    }
    
    private static func createApiDataSource() -> CharacterApiDataSourceType {
        CharacterApiDataSource(httpClient: createHttpClient())
    }
    
    private static func createHttpClient() -> HTTPClientType {
        URLSessionHTTPClient(
            requestMaquer: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver()
        )
    }
}
