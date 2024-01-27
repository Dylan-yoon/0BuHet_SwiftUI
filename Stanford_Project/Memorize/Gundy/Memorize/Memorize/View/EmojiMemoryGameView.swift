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
            header
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
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
                .font(.title)
        }
    }
    
    private var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            Task {
                                viewModel.choose(card)
                            }
                        }
                }
            }
            .foregroundStyle(Color(
                red: viewModel.themeColor.red,
                green: viewModel.themeColor.green,
                blue: viewModel.themeColor.blue
            ))
        }
    }
    
    var footer: some View {
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
