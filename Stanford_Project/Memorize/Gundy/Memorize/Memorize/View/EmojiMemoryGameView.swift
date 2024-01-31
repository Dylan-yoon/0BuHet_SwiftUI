//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Gundy on 1/16/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            header
            cards
                .animation(.default, value: viewModel.cards)
            footer
        }
        .padding()
    }
    
    private var header: some View {
        HStack {
            Text(viewModel.themeName)
                .font(.largeTitle)
            Spacer()
            Text(viewModel.score)
        }
        .font(.title)
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    Task {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundStyle(Gradient(colors: viewModel.colors))
    }
    
    private var footer: some View {
        HStack {
            Button("NewGame") {
                viewModel.playNewGame()
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .font(.title3)
        .padding([.leading, .trailing])
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
