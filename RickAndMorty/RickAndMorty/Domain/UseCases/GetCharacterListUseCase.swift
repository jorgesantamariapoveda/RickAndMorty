//
//  GetCharacterListUseCase.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation
    
final class GetCharacterListUseCase {
    private let repository: CharacterListRepositoryType
    
    init(repository: CharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Character], CharacterDomainError> {
        let result = await repository.getCharacterList()
        
        switch result {
        case .success(let characterList):
            return .success(characterList)
        case .failure(let error):
            return .failure(error)
        }
    }
}
