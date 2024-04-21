import Foundation

final class EpisodeDomainMapper {
    func map(episode: EpisodeDTO) -> Episode {
        Episode(
            id: episode.id,
            name: episode.name
        )
    }
}
