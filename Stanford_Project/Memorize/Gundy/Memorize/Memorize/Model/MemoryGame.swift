//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gundy on 1/22/24.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var score: Int = 0
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
        shuffle()
    }
    
    mutating func choose(_ card: Card) {
        guard let index = cards.firstIndex(of: card) else { return }
        
        guard cards[index].isFaceUp == false,
              cards[index].isMatched == false else { return }
        
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[potentialMatchIndex].content == cards[index].content {
                cards[potentialMatchIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
            } else {
                if cards[potentialMatchIndex].isBeenSeen {
                    score -= 1
                }
                
                if cards[index].isBeenSeen {
                    score -= 1
                }
            }
            
            indexOfTheOneAndOnlyFaceUpCard = nil
            cards[potentialMatchIndex].isBeenSeen = true
            cards[index].isBeenSeen = true
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            
            indexOfTheOneAndOnlyFaceUpCard = index
        }
        
        cards[index].isFaceUp = true
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isBeenSeen = false
        let content: CardContent
        let id = UUID()
    }
}
