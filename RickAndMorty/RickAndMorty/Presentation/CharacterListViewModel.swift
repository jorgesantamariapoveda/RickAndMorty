import Foundation

struct CharacterListRepresentable {
    let id: Int
    let name: String
    let statusAndSpecie: String
    let lastKnownLocation: String
    
    init(domainModel: Character) {
        self.id = domainModel.id
        self.name = domainModel.name
        self.statusAndSpecie = domainModel.status + " - " + domainModel.species
        self.lastKnownLocation = domainModel.lastKnownLocation
    }
}

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
    @Published var errors = ""
    
    init(getCharacterListUseCase: GetCharacterListUseCaseType) {
        self.getCharacterListUseCase = getCharacterListUseCase
    }
    
    @MainActor
    func onAppear() {
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
}
