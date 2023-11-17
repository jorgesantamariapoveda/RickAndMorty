//
//  CharacterApiDataSourceType.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

protocol CharacterApiDataSourceType {
    func getCharacterList() async -> Result<[CharacterDTO], HTTPClientError>
}
