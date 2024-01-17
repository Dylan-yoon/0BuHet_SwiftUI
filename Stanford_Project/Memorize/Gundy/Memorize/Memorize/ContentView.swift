//
//  ContentView.swift
//  Memorize
//
//  Created by Gundy on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var emojis = [String]()
    @State private var themeColor = Color.clear
    
    var body: some View {
        VStack {
            title
            cards
            Spacer()
            themes
        }
        .padding()
    }
    
    private var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    private var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(0..<emojis.count, id: \.self) { index in
                    CardView(content: emojis[index])
                        .aspectRatio(2 / 3, contentMode: .fit)
                }
            }
            .foregroundStyle(themeColor)
        }
    }
    
    private var themes: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: Theme.allCases.count)) {
            ForEach(Theme.allCases, id: \.self) { theme in
                themeButton(theme.imageName, theme.name) {
                    let newEmojis = theme.emojis.shuffled()
                    
                    emojis = newEmojis + newEmojis
                    themeColor = theme.color
                }
            }
        }
    }
    
    private func themeButton(_ imageName: String, _ name: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                    .imageScale(.large)
                Text(name)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    ContentView()
}
