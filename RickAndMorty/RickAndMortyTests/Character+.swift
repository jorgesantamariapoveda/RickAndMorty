import XCTest
import SwiftUI
@testable import RickAndMorty

final class CharacterExtensionTests: XCTestCase {
    
    func test_Given_Character_When_UseStatusAndSpecieDescription_Then_IsCorrectFormated() {
        // Given
        let character = Character(
            id: 1,
            name: "",
            status: .alive,
            species: "Species",
            lastKnownLocation: "Location",
            episodeList: [],
            image: nil
        )
        
        // When
        let description = character.statusAndSpecieDescription
        
        // Then
        XCTAssertEqual(character.status.rawValue.capitalized + " - " + character.species, description)
    }
    
    func test_Given_Character_When_UseStatusColor_Then_ReturnCorrectColor() {
        // Given
        let characterAlive = Character(
            id: 1,
            name: "",
            status: .alive,
            species: "",
            lastKnownLocation: "",
            episodeList: [],
            image: nil
        )
        let characterDead = Character(
            id: 1,
            name: "",
            status: .dead,
            species: "",
            lastKnownLocation: "",
            episodeList: [],
            image: nil
        )
        let characterUnknow = Character(
            id: 1,
            name: "",
            status: .unknown,
            species: "",
            lastKnownLocation: "",
            episodeList: [],
            image: nil
        )
        
        // When
        let statusColorAlive = characterAlive.statusColor
        let statusColorDead = characterDead.statusColor
        let statusColorUnknow = characterUnknow.statusColor
        
        // Then
        XCTAssertEqual(statusColorAlive, Color.green)
        XCTAssertEqual(statusColorDead, Color.red)
        XCTAssertEqual(statusColorUnknow, Color.gray)
    }
}
