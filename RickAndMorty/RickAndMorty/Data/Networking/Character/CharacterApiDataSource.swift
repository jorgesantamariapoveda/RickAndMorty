import Foundation

protocol CharacterApiDataSourceType {
    func getCharacterList() async throws -> [CharacterDTO]
}

final class CharacterApiDataSource: CharacterApiDataSourceType {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async throws -> [CharacterDTO] {
        let data = try await httpClient.makeRequest(
            baseUrl: "https://rickandmortyapi.com/api/",
            path: "character",
            method: .get
        )
        
        guard let result = try? JSONDecoder().decode(CharacterListDTO.self, from: data) else {
            throw HTTPClientError.parsingError
        }
        
        return result.results
    }
}
