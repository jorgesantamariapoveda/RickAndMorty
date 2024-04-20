import Foundation

protocol CharacterApiDataSourceType {
    func getCharacterList() async throws -> [CharacterDTO]
}
