import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    enum Constant {
        static let sizeImage: CGFloat = 300
        static let cornerRadiusImage: CGFloat = 16
        static let opacityBackground: CGFloat = 0.75
        static let radioStatusColor: CGFloat = 8
        static let placeholderImageName = "person.crop.circle"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            characterImageSubview
                .padding(.bottom)

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: .zero) {
                    Text(character.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(alignment: .center) {
                        Circle()
                            .frame(width: Constant.radioStatusColor, height: Constant.radioStatusColor)
                            .foregroundStyle(character.statusColor)
                        
                        Text(character.statusAndSpecieDescription)
                            .font(.body)
                    }
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: .zero) {
                    Text("Last known location:")
                        .font(.body)
                        .foregroundStyle(Color.gray)
                    Text(character.lastKnownLocation)
                        .font(.title3)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: .zero) {
                    Text("First seen in:")
                        .font(.body)
                        .foregroundStyle(Color.gray)
                    Text(character.firstSeenIn)
                        .font(.title3)
                }
            }
            
            Spacer()
        }
    }
    
    private var characterImageSubview: some View {
        AsyncImage(url: character.image) { image in
            image
                .resizable()
        } placeholder: {
            Image(systemName: Constant.placeholderImageName)
                .resizable()
        }
        .frame(width: Constant.sizeImage, height: Constant.sizeImage)
        .cornerRadius(Constant.cornerRadiusImage)
    }
}

#Preview {
    let character = Character(
        id: 1,
        name: "Spiderweb teddy bear",
        status: .dead,
        species: "Animal",
        lastKnownLocation: "Citadel of Ricks",
        firstSeenIn: "Childrick of Mort",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/406.jpeg")
    )
    return CharacterDetailView(character: character)
}
