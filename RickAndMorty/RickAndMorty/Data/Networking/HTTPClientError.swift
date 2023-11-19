//
//  HTTPClientError.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case badURL
    case responseError
    case genericError
}
