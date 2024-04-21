import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject private var viewModel: CharacterDetailViewModel

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }
    
    enum Constant {
        static let sizeImage: CGFloat = 300
        static let cornerRadiusImage: CGFloat = 16
        static let opacityBackground: CGFloat = 0.75
        static let radioStatusColor: CGFloat = 8
        static let placeholderImageName = "person.crop.circle"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CharacterImageView(
                imageURL: viewModel.character.image,
                width: Constant.sizeImage, height: Constant.sizeImage,
                cornerRadius: Constant.cornerRadiusImage
            ).padding(.bottom)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: .zero) {
                    Text(viewModel.character.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(alignment: .center) {
                        Circle()
                            .frame(width: Constant.radioStatusColor, height: Constant.radioStatusColor)
                            .foregroundStyle(viewModel.character.statusColor)
                        
                        Text(viewModel.character.statusAndSpecieDescription)
                            .font(.body)
                    }
                }.padding(.bottom)
                
                CharacterSectionSubview(
                    title: "Last known location:",
                    subtitle: viewModel.character.lastKnownLocation
                ).padding(.bottom)
                
                CharacterSectionSubview(
                    title: "First seen in:",
                    subtitle: viewModel.firstSeenIn
                ).padding(.bottom)
            }
            
            Spacer()
        }
        .onAppear {
            viewModel.getEpisode()
        }
    }
}

//#Preview {
//    let character = Character(
//        id: 1,
//        name: "Spiderweb teddy bear",
//        status: .dead,
//        species: "Animal",
//        lastKnownLocation: "Citadel of Ricks",
//        episodeList: [],
//        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/406.jpeg")
//    )
//    return CharacterDetailView(character: character)
//}
