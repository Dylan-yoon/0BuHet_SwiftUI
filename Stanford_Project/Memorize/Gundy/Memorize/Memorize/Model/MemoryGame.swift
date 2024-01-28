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
    private var pickedTime: Date?
    
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
                score += 200 + max(-100, 20 * Int(pickedTime?.timeIntervalSinceNow ?? 0))
            } else {
                if cards[potentialMatchIndex].isBeenSeen {
                    score -= 100
                }
                
                if cards[index].isBeenSeen {
                    score -= 100
                }
            }
            
            indexOfTheOneAndOnlyFaceUpCard = nil
            cards[potentialMatchIndex].isBeenSeen = true
            cards[index].isBeenSeen = true
            pickedTime = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            
            indexOfTheOneAndOnlyFaceUpCard = index
            pickedTime = .now
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
