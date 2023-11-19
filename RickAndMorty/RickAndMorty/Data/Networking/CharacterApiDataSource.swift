//
//  CharacterApiDataSource.swift
//  RickAndMorty
//
//  Created by Jorge on 19/11/23.
//

import Foundation

final class CharacterApiDataSource: CharacterApiDataSourceType {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async -> Result<[CharacterDTO], HTTPClientError> {
        let endpoint = Endpoint(
            path: "character",
            method: .get
        )
        
        let result = await httpClient.makeRequest(
            endpoint: endpoint,
            baseUrl: "https://rickandmortyapi.com/api/"
        )
        
        switch result {
        case .success(let data):
            guard let characterList = try? JSONDecoder().decode(CharacterListDTO.self, from: data) else {
                return .failure(.parsingError)
            }
            return .success(characterList.results)
        case .failure(let error):
            return .failure(error)
        }
    }
}
