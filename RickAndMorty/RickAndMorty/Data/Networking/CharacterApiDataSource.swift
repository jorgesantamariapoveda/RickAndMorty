import Foundation

final class CharacterApiDataSource: CharacterApiDataSourceType {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async throws -> [CharacterDTO] {
        let endpoint = Endpoint(
            path: "character",
            method: .get
        )
        
        let data = try await httpClient.makeRequest(
            endpoint: endpoint,
            baseUrl: "https://rickandmortyapi.com/api/"
        )
        
        let result = try JSONDecoder().decode(CharacterListDTO.self, from: data)
        
        return result.results
    }
}
