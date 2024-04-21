import XCTest
@testable import RickAndMorty

final class CharacterDomainMapperTests: XCTestCase {
    
    func test_Given_CreateCharacterDomainMapper_When_UseIt_Then_ReturnSameNumberElementsThanParameter() {
        // Given
        let mapper = CharacterDomainMapper()
        let characterList: [CharacterDTO] = [
            .init(
                id: 1,
                name: "Name 1",
                status: .alive,
                species: "Species 1",
                location: .init(name: "Location"),
                image: "Image",
                episodeList: ["1", "2", "3"]
            )
        ]
        
        // When
        let characterListMapped = mapper.map(characterList: characterList)
        
        // Then
        XCTAssertEqual(characterListMapped.count, characterList.count)
    }
    
    func test_Given_CreateCharacterDomainMapper_When_UseIt_Then_ReturnCorrectlyNewCharacterList() {
        // Given
        let mapper = CharacterDomainMapper()
        let characterList: [CharacterDTO] = [
            .init(
                id: 1,
                name: "Name1",
                status: .alive,
                species: "Species1",
                location: .init(name: "Location1"),
                image: "Image1",
                episodeList: ["1", "2", "3"]
            ),
            .init(
                id: 2,
                name: "Name2",
                status: .dead,
                species: "Species2",
                location: .init(name: "Location2"),
                image: "Image2",
                episodeList: ["10", "20", "30"]
            ),
            .init(
                id: 3,
                name: "Name3",
                status: .unknown,
                species: "Species3",
                location: .init(name: "Location3"),
                image: "Image3",
                episodeList: ["1", "2", "3"]
            ),
        ]
        
        // When
        let characterListMapped = mapper.map(characterList: characterList)
        
        // Then
        var index = 0
        characterListMapped.forEach { characterMapped in
            let character = characterList[index]
            XCTAssertEqual(characterMapped.id, character.id)
            XCTAssertEqual(characterMapped.name, character.name)
            XCTAssertEqual(characterMapped.status, character.characterStatus)
            XCTAssertEqual(characterMapped.species, character.species)
            XCTAssertEqual(characterMapped.lastKnownLocation, character.location.name)
            XCTAssertEqual(characterMapped.episodeList, character.episodeList)
            XCTAssertEqual(characterMapped.image, URL(string: character.image))
            
            index += 1
        }
    }
}
