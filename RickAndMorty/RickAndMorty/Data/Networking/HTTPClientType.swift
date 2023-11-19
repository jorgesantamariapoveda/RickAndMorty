//
//  HTTPClientType.swift
//  RickAndMorty
//
//  Created by Jorge on 19/11/23.
//

import Foundation

protocol HTTPClientType {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}
