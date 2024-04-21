import SwiftUI

struct CharacterView: View {
    let character: CharacterListRepresentable
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: .spacingL) {
                HeaderCardCharacter(title: character.name, subtitle: character.statusAndSpecie)
                BodyCardCharacter(title: "Last known location:", subtitle: character.lastKnownLocation)
                BodyCardCharacter(title: "First seen in:", subtitle: "Rick Potion #9")
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(.gray.opacity(0.35)))
    }
}

struct HeaderCardCharacter: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(title)
                .font(.body)
                .bold()
            Text(subtitle)
                .font(.caption)
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

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
