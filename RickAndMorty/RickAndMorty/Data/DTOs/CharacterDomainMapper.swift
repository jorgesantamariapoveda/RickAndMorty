import Foundation

final class CharacterDomainMapper {
    func map(characterList: [CharacterDTO]) -> [Character] {
        characterList.map { character in
            Character(
                id: character.id,
                name: character.name,
                status: character.status.rawValue,
                species: character.species,
                lastKnownLocation: character.location.name,
                firstSeenIn: "" //!! Review 🔴
            )
        }
    }
}
