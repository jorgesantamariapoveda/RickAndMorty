import Foundation

final class CharacterRepository: CharacterListRepositoryType {
    private var apiDataSource: CharacterApiDataSourceType
    private var domainMapper: CharacterDomainMapper

    init(
        apiDataSource: CharacterApiDataSourceType,
        domainMapper: CharacterDomainMapper
    ) {
        self.apiDataSource = apiDataSource
        self.domainMapper = domainMapper
    }
    
    func getCharacterList() async throws -> [Character] {
        let characterList = try await apiDataSource.getCharacterList()
        
        return domainMapper.map(characterList: characterList)
    }
}
