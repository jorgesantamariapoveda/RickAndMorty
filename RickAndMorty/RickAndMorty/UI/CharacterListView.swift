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
                Text("Idle")
            case .loading:
                Text("Loading")
            case .loaded:
                VStack {
                    Text("Loaded")
                    listView
                        
                }
            case .error:
                Text("Error")
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    var listView: some View {
        List {
            ForEach(viewModel.characters, id: \.id) { character in
                VStack(alignment: .leading) {
                    Text(character.name)
                    Text(character.statusAndSpecie)
                    Text(character.lastKnownLocation)
                }
                .background(Color.blue)
            }
        }
    }
}
//
//struct CharacterListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListView()
//    }
//}
