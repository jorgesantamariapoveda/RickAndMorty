import Foundation

final class CharacterDomainMapper {
    func map(characterList: [CharacterDTO]) -> [Character] {
        characterList.map { character in
            Character(
                id: character.id,
                name: character.name,
                status: character.characterStatus,
                species: character.species,
                lastKnownLocation: character.location.name,
                episodeList: character.episodeList,
                image: URL(string: character.image)
            )
        }
    }
}
