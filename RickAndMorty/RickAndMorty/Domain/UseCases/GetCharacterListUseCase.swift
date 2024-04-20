import Foundation

protocol GetCharacterListUseCaseType {
    func execute() async throws -> [Character]
}
    
final class GetCharacterListUseCase: GetCharacterListUseCaseType {
    private let repository: CharacterListRepositoryType
    
    init(repository: CharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async throws -> [Character] {
        try await repository.getCharacterList()
    }
}
