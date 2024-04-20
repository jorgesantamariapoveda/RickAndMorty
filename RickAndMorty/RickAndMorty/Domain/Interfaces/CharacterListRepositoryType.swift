import Foundation

protocol CharacterListRepositoryType {
    func getCharacterList() async -> Result<[Character], CharacterDomainError>
}
