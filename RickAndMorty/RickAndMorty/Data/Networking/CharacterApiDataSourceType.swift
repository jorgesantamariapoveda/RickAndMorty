import Foundation

protocol CharacterApiDataSourceType {
    func getCharacterList() async -> Result<[CharacterDTO], HTTPClientError>
}
