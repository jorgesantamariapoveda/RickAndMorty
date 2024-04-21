import Foundation

final class CharacterDetailViewModel: ObservableObject {
    private let getEpisodeUseCase: GetEpisodeUseCaseType
    let character: Character
    
    init(
        character: Character,
        getEpisodeUseCase: GetEpisodeUseCaseType
    ) {
        self.character = character
        self.getEpisodeUseCase = getEpisodeUseCase
    }
    
    @Published var firstSeenIn: String = ""
    
    @MainActor
    func getEpisode() {
        guard let firstEpisode = character.episodeList.first else { return }
        
        Task {
            do {
                let episode = try await getEpisodeUseCase.execute(url: firstEpisode)
                firstSeenIn = episode.name
            } catch {
                print("🔴 \(error)") //!! Review 🔴 Improve
            }
        }
    }
}
