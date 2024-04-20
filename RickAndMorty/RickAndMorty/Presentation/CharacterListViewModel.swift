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
    
    func onAppear() {
        state = .loading
        Task {
            let result = await getCharacterListUseCase.execute()
            
            Task { @MainActor in
                switch result {
                case .success(let characterList):
                    state = .loaded
                    characters = characterList.map { CharacterListRepresentable(domainModel: $0) }
                    print("koko")
                case .failure(let error):
                    state = .error
                    errors = error.localizedDescription
                }
            }
        }
    }
}
