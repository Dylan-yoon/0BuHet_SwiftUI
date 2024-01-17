//
//  Theme.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

import SwiftUI

enum Theme: CaseIterable {
    case animal
    case fruit
    case heart
    
    var name: String {
        switch self {
        case .animal:
            return "Animal"
        case .fruit:
            return "Fruit"
        case .heart:
            return "Heart"
        }
    }
    
    var imageName: String {
        switch self {
        case .animal:
            return "dog.circle"
        case .fruit:
            return "apple.logo"
        case .heart:
            return "heart"
        }
    }
    
    var emojis: [String] {
        switch self {
        case .animal:
            return ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵"]
        case .fruit:
            return ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝"]
        case .heart:
            return ["🩷","❤️","🧡","💛","💚","🩵","💙","💜","🖤","🩶","🤍","🤎"]
        }
    }
    
    var color: Color {
        switch self {
        case .animal:
            return .orange
        case .fruit:
            return .green
        case .heart:
            return .red
        }
    }
}
