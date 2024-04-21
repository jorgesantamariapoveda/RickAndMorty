import SwiftUI

struct CharacterView: View {
    let character: CharacterListRepresentable
    
    enum Constant {
        static let sizeImage: CGFloat = 100
        static let cornerRadiusBackground: CGFloat = 16
        static let opacityBackground: CGFloat = 0.75
        static let radioStatusColor: CGFloat = 8
        static let placeholderImageName = "person.crop.circle"
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: Constant.placeholderImageName)
                    .resizable()
            }
            .frame(width: Constant.sizeImage, height: Constant.sizeImage)
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack {
                    Circle()
                        .frame(width: Constant.radioStatusColor, height: Constant.radioStatusColor)
                        .foregroundStyle(character.statusColor)
                    
                    Text(character.statusAndSpecie)
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
        let model = Character(
            id: 1,
            name: "Spiderweb teddy bear",
            status: .alive,
            species: "Animal",
            lastKnownLocation: "lastKnownLocation",
            firstSeenIn: "firstSeenIn",
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/406.jpeg")
        )
        let representable = CharacterListRepresentable(domainModel: model)
        
        CharacterView(character: representable)
            .previewLayout(.sizeThatFits)
    }
}
