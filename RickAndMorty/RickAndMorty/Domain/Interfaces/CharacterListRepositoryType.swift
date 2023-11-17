//
//  CharacterListRepositoryType.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

protocol CharacterListRepositoryType {
    func getCharacterList() async -> Result<[Character], CharacterDomainError>
}
