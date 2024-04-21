import SwiftUI

struct CharacterView: View {
    let character: CharacterListRepresentable
    
    enum Constant {
        static let sizeImage: CGFloat = 100
        static let cornerRadiusBackground: CGFloat = 16
        static let opacityBackground: CGFloat = 0.75
        static let radioStatusColor: CGFloat = 8
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .frame(width: Constant.sizeImage, height: Constant.sizeImage)
            } placeholder: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: Constant.sizeImage, height: Constant.sizeImage)
            }
            
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


struct CharacterView2: View {
    let character: CharacterListRepresentable
    
    enum Constant {
        static let sizeImage: CGFloat = 150
        static let cornerRadiusBackground: CGFloat = 12
        static let opacityBackground: CGFloat = 0.35
    }
    
    var body: some View {
        HStack(spacing: .spacingM) {
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .frame(width: Constant.sizeImage, height: Constant.sizeImage)
            } placeholder: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: Constant.sizeImage, height: Constant.sizeImage)
            }

            VStack(alignment: .leading, spacing: .spacingL) {
                HeaderCardCharacter(title: character.name, statusColor: character.statusColor, subtitle: character.statusAndSpecie)
                BodyCardCharacter(title: "Last known location:", subtitle: character.lastKnownLocation)
                BodyCardCharacter(title: "First seen in:", subtitle: "Rick Potion #9")
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Constant.cornerRadiusBackground)
                .fill(.gray.opacity(Constant.opacityBackground))
        )
    }
}

struct HeaderCardCharacter: View {
    let title: String
    let statusColor: Color
    let subtitle: String
    
    enum Constant {
        static let radioStatusColor: CGFloat = 8
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(title)
                .font(.body)
                .bold()
            HStack {
                Circle()
                    .frame(width: Constant.radioStatusColor, height: Constant.radioStatusColor)
                    .foregroundStyle(statusColor)
                Text(subtitle)
                    .font(.caption)
            }
        }
    }
}

struct BodyCardCharacter: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(subtitle)
                .font(.subheadline)
        }
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
