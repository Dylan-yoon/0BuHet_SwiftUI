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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumCardWidth()))]) {
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
                    var newEmojis = theme.emojis
                    let randomCount = Int.random(in: 2...newEmojis.count)
                    
                    newEmojis = Array(theme.emojis[0..<randomCount])
                    emojis = (newEmojis + newEmojis).shuffled()
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
    
    private func minimumCardWidth() -> CGFloat {
        var count = 2
        
        while count * count < emojis.count,
              count < 5 {
            count += 1
        }
        
        return CGFloat(280 / count)
    }
}

#Preview {
    ContentView()
}
