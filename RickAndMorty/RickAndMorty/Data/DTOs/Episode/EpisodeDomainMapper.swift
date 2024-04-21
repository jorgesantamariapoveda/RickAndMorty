//
//  EpisodeDomainMapper.swift
//  RickAndMorty
//
//  Created by Jorge on 21/4/24.
//

import Foundation

final class EpisodeDomainMapper {
    func map(episode: EpisodeDTO) -> Episode {
        Episode(
            id: episode.id,
            name: episode.name
        )
    }
}
