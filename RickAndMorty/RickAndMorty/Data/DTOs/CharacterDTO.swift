//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let location: Location
    
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    
    struct Location: Decodable {
        let name: String
    }
}
