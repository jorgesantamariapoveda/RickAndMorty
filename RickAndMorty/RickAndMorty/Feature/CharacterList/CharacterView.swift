import SwiftUI

struct CharacterView: View {
    let character: Character
    
    enum Constant {
        static let sizeImage: CGFloat = 100
        static let cornerRadiusImage: CGFloat = 16
        static let opacityBackground: CGFloat = 0.75
        static let radioStatusColor: CGFloat = 8
        static let placeholderImageName = "person.crop.circle"
    }
    
    var body: some View {
        HStack {
            CharacterImageView(
                imageURL: character.image,
                width: Constant.sizeImage, height: Constant.sizeImage,
                cornerRadius: Constant.cornerRadiusImage
            )
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack {
                    Circle()
                        .frame(width: Constant.radioStatusColor, height: Constant.radioStatusColor)
                        .foregroundStyle(character.statusColor)
                    
                    Text(character.statusAndSpecieDescription)
                        .font(.caption)
                    
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(
            id: 1,
            name: "Spiderweb teddy bear",
            status: .alive,
            species: "Animal",
            lastKnownLocation: "lastKnownLocation",
            episodeList: [],
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/406.jpeg")
        )
        
        CharacterView(character: character)
            .previewLayout(.sizeThatFits)
    }
}
