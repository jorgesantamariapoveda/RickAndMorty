//
//  CharacterDomainErrorMapper.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

final class CharacterDomainErrorMapper {
    func map(error: HTTPClientError) -> CharacterDomainError {
        //!! Review 🔴
        switch error {
        case .clientError:
            return .generic
        case .serverError:
            return .generic
        }
    }
}
