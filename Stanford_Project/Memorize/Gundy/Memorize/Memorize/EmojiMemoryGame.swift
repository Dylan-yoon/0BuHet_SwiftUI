//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gundy on 1/22/24.
//

import SwiftUI

final class EmojiMemoryGame: ObservableObject {
    private static func createNewGame() -> (MemoryGame<String>, Theme) {
        let theme = Theme.themes.randomElement() ?? Theme.themes[0]
        let emojis = theme.emojis.shuffled()
        
        return (
            MemoryGame(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
                emojis[pairIndex]
            }, theme
        )
    }
    
    @Published private var model: MemoryGame<String>!
    private var  currentTheme: Theme!
    
    init() {
        playNewGame()
    }
    
    var themeName: String {
        currentTheme.name
    }
    
    var score: String {
        String(model.score)
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeColor: (red: Double, green: Double, blue: Double) {
        currentTheme.color
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func playNewGame() {
        let (memoryGame, theme) = EmojiMemoryGame.createNewGame()
        
        model = memoryGame
        currentTheme = theme
    }
}
