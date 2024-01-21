//
//  CardView.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

import SwiftUI

final class Card: ObservableObject {
    let content: String
    @Published var isFaceUp = false
    
    init(content: String) {
        self.content = content
    }
}

struct CardView: View {
    @ObservedObject var card: Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            card
                .isFaceUp
                .toggle()
        }
    }
}

#Preview {
    CardView(card: Card(content: Theme.animal.emojis[0]))
        .padding()
}
