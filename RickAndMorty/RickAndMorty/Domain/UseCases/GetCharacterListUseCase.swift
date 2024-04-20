//
//  GetCharacterListUseCase.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

protocol GetCharacterListUseCaseType {
    func execute() async -> Result<[Character], CharacterDomainError>
}
    
final class GetCharacterListUseCase: GetCharacterListUseCaseType {
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
