import Foundation

final class CharacterApiDataSourceMock: CharacterApiDataSourceType {
    
    func getCharacterList() async throws -> [CharacterDTO] {
        let data = Data(characterListJSON.utf8)
        
        guard let result = try? JSONDecoder().decode(CharacterListDTO.self, from: data) else {
            throw HTTPClientError.parsingError
        }
        
        return result.results
    }
}
