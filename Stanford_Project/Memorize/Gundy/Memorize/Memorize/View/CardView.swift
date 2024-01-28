//
//  CardView.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .opacity(card.isMatched ? 0.5 : card.isFaceUp ? 1 : 0)
            }
            base
                .fill()
                .opacity(card.isFaceUp || card.isMatched ? 0 : 1)
            base.stroke()
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CardView(.init(content: "🎃"))
        .padding()
}
