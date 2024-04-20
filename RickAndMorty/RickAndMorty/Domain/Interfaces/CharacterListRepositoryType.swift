import Foundation

protocol CharacterListRepositoryType {
    func getCharacterList() async throws -> [Character]
}
