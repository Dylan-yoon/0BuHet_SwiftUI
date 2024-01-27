//
//  Theme.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

struct Theme {
    static let themes: [Theme] = [
        Theme(name: "Animal", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵"], color: (1,0,0)),
        Theme(name: "Fruit", emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝"], color: (0,1,0)),
        Theme(name: "Heart", emojis: ["🩷","❤️","🧡","💛","💚","🩵","💙","💜","🖤","🩶","🤍","🤎"], color: (0,0,1)),
        Theme(name: "Halloween", emojis: ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"], color: (1,1,0)),
        Theme(name: "Weather", emojis: ["☀️","☁️","☂️","☃️","💨","🌩️"], color: (0,1,1)),
        Theme(name: "Drink", emojis: ["🥛","☕️","🧋","🍶","🍺","🍷","🥃","🍸","🍹","🧉"], color: (1,0,1)),
    ]
    
    let name: String
    let emojis: [String]
    let color: (red: Double, green: Double, blue: Double)
}
