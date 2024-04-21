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
    @Published var errors = "" {
        didSet {
            showErrors = !errors.isEmpty
        }
    }
    @Published var showErrors = false
    
    @Published var characters = [Character]()
    
    init(getCharacterListUseCase: GetCharacterListUseCaseType) {
        self.getCharacterListUseCase = getCharacterListUseCase
    }
    
    @MainActor
    func getCharacterList() {
        state = .loading
        
        Task {
            do {
                characters = try await getCharacterListUseCase.execute()
                state = .loaded
            } catch {
                state = .error
                errors = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func getCharacterListMock() {
        state = .loading
        
        Task {
            do {
                let datasource = CharacterApiDataSourceMock()
                let mapper = CharacterDomainMapper()
                
                let characterList = try await datasource.getCharacterList()
                characters = mapper.map(characterList: characterList)
                state = .loaded
            } catch {
                state = .error
                errors = error.localizedDescription
            }
        }
    }
}
