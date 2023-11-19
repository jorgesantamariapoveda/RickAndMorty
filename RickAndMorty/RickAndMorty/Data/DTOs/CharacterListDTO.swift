//
//  CharacterListDTO.swift
//  RickAndMorty
//
//  Created by Jorge on 19/11/23.
//

import Foundation

struct CharacterListDTO: Decodable {
    let results: [CharacterDTO]
}
