import SwiftUI

struct CharacterSectionSubview: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .font(.body)
                .foregroundStyle(Color.gray)
            Text(subtitle)
                .font(.title3)
        }
    }
}

#Preview {
    CharacterSectionSubview(
        title: "Title",
        subtitle: "Subtitle"
    )
}
