import SwiftUI

struct CharacterImageView: View {
    let imageURL: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    enum Constant {
        static let placeholderImageName = "person.crop.circle"
    }
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
        } placeholder: {
            Image(systemName: Constant.placeholderImageName)
                .resizable()
        }
        .frame(width: width, height: height)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    CharacterImageView(
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        width: 150,
        height: 150,
        cornerRadius: 16
    )
}
