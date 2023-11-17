//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

final class CharacterRepository: CharacterListRepositoryType {
    private var apiDataSource: CharacterApiDataSourceType
    private var domainMapper: CharacterDomainMapper
    private var domainErrorMapper: CharacterDomainErrorMapper

    init(
        apiDataSource: CharacterApiDataSourceType,
        domainMapper: CharacterDomainMapper,
        domainErrorMapper: CharacterDomainErrorMapper
    ) {
        self.apiDataSource = apiDataSource
        self.domainMapper = domainMapper
        self.domainErrorMapper = domainErrorMapper
    }
    
    func getCharacterList() async -> Result<[Character], CharacterDomainError> {
        let result = await apiDataSource.getCharacterList()
        
        switch result {
        case .success(let characterList):
            return .success(domainMapper.map(characterList: characterList))
        case .failure(let error):
            return .failure(domainErrorMapper.map(error: error))
        }
    }
}
