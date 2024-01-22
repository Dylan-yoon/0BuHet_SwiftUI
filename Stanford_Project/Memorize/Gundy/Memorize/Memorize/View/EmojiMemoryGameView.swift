//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Gundy on 1/16/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardView(viewModel.cards[index])
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .padding(4)
                }
            }
            .foregroundStyle(Color.orange)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
