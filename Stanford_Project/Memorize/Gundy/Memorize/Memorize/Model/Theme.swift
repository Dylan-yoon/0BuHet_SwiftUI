//
//  Theme.swift
//  Memorize
//
//  Created by Gundy on 1/17/24.
//

struct Theme {
    static let themes: [Theme] = [
        Theme(name: "Animal", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵"], colors: [(0.5,0,0),(1,0,0),(0.5,0,0)]),
        Theme(name: "Fruit", emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝"], colors: [(0,1,0),(0,0.5,0)]),
        Theme(name: "Heart", emojis: ["🩷","❤️","🧡","💛","💚","🩵","💙","💜","🖤","🩶","🤍","🤎"], colors: [(0,0,1),(0,0,0.5)]),
        Theme(name: "Halloween", emojis: ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"], colors: [(1,1,0)]),
        Theme(name: "Weather", emojis: ["☀️","☁️","☂️","☃️","💨","🌩️"], colors: [(0,1,1)]),
        Theme(name: "Drink", emojis: ["🥛","☕️","🧋","🍶","🍺","🍷","🥃","🍸","🍹","🧉"], colors: [(1,0,1)]),
    ]
    
    let name: String
    let emojis: [String]
    let colors: [(red: Double, green: Double, blue: Double)]
}
