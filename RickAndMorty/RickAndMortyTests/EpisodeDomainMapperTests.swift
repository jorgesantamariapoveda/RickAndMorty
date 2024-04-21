import XCTest
@testable import RickAndMorty

final class EpisodeDomainMapperTests: XCTestCase {
    
    func test_Given_CreateEpisodeDomainMapper_When_UseIt_Then_ReturnCorrectlyNewCharacterList() {
        // Given
        let mapper = EpisodeDomainMapper()
        let episode = EpisodeDTO(id: 1, name: "Name 1")
        
        // When
        let episodeMapper = mapper.map(episode: episode)
        
        // Then
        XCTAssertEqual(episodeMapper.id, episode.id)
        XCTAssertEqual(episodeMapper.name, episode.name)
    }
}
