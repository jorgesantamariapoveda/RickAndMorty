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
            CharacterImageView(
                imageURL: character.image,
                width: Constant.sizeImage, height: Constant.sizeImage,
                cornerRadius: Constant.cornerRadiusImage
            ).padding(.bottom)
            
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
                }.padding(.bottom)
                
                CharacterSectionSubview(
                    title: "Last known location:",
                    subtitle: character.lastKnownLocation
                ).padding(.bottom)
                
                CharacterSectionSubview(
                    title: "First seen in:",
                    subtitle: character.firstSeenIn
                ).padding(.bottom)
            }
            
            Spacer()
        }
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
