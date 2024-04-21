import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded:
                NavigationStack {
                    List {
                        ForEach(viewModel.characters) { character in
                            NavigationLink {
                                CharacterDetailFactory.create(character: character)
//                                Text("Implementar \(character.episodeList.count)")
//                                CharacterDetailView(character: character)
                            } label: {
                                CharacterView(character: character)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .navigationTitle("Characters")
                }
            case .error:
                Text("Error") //!! Review 🔴 Improve
            }
        }
        .onAppear {
            viewModel.getCharacterList()
        }
        .alert("Error", isPresented: $viewModel.showErrors) {
            Button("Try with Mock") {
                viewModel.getCharacterListMock()
            }
        } message: {
            Text(viewModel.errors)
        }
    }
}
