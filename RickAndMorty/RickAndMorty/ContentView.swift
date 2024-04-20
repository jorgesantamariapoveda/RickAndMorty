//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Jorge on 17/11/23.
//

import SwiftUI

extension CGFloat {
    /// 4
    static let spacingXS: CGFloat = 4
    /// 8
    static let spacingS: CGFloat = 8
    /// 12
    static let spacingM: CGFloat = 12
    /// 16
    static let spacingL: CGFloat = 16
    /// 24
    static let spacingXL: CGFloat = 24
    /// 32
    static let spacingXXL: CGFloat = 32
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CardCharacter()
                    CardCharacter()
                    CardCharacter()
                    CardCharacter()
                    CardCharacter()
                    CardCharacter()
                }
                .padding()
            }
            .navigationTitle("The Rick and Morty")
        }
    }
}

struct CardCharacter: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(.red)
            VStack(alignment: .leading, spacing: .spacingL) {
                HeaderCardCharacter(title: "Jerry Smith", subtitle: "🟢 Alive - Human")
                BodyCardCharacter(title: "Last known location:", subtitle: "Earth (Replacement Dimension)")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
