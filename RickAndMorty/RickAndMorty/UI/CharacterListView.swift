import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded:
                List {
                    ForEach(viewModel.characters) { character in
                        CardCharacter(character: character)
                    }
                }
            case .error:
                Text("Error")
            }
        }
        .onAppear {
            viewModel.getCharacterList()
        }
    }
}
//
//struct CharacterListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListView()
//    }
//}
