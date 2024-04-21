import Foundation

final class CharacterListViewModel: ObservableObject {
    private let getCharacterListUseCase: GetCharacterListUseCaseType
    
    enum State {
        case idle
        case loading
        case loaded
        case error
    }
    
    @Published var state: State = .idle
    @Published var characters = [CharacterListRepresentable]()
    @Published var errors = "" {
        didSet {
            showErrors = !errors.isEmpty
        }
    }
    @Published var showErrors = false
    
    init(getCharacterListUseCase: GetCharacterListUseCaseType) {
        self.getCharacterListUseCase = getCharacterListUseCase
    }
    
    @MainActor
    func getCharacterList() {
        state = .loading
        
        Task {
            do {
                let result = try await getCharacterListUseCase.execute()
                state = .loaded
                characters = result.map { CharacterListRepresentable(domainModel: $0) }
            } catch {
                state = .error
                errors = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func getCharacterListMock() {
        state = .loading
        
        let datasource = CharacterApiDataSourceMock()
        let mapper = CharacterDomainMapper()
        
        Task {
            do {
                let result = try await datasource.getCharacterList()
                let result2 = mapper.map(characterList: result)
                state = .loaded
                characters = result2.map { CharacterListRepresentable(domainModel: $0) }
            } catch {
                state = .error
                errors = error.localizedDescription
            }
        }
    }
}
