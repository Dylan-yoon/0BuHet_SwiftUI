//
//  CardView.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State private var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base
                .fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp
                .toggle()
        }
    }
}

#Preview {
    CardView(content: Theme.animal.emojis[0])
        .padding()
}
