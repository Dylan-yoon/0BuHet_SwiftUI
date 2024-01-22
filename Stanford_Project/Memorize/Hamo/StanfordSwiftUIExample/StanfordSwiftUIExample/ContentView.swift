//
//  ContentView.swift
//  StanfordSwiftUIExample
//
//  Created by 이태영 on 1/17/24.
//

import SwiftUI

struct ContentView: View {
  @State private var emojis: [String] = []
  @State private var color: Color = .orange
  
  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)

      ScrollView {
        cards
      }
      
      HStack(spacing: 30) {
        holloweenThemeButton
        fruitThemeButton
        vehicleThemeButton
      }
    }
    .padding()
  }
  
  private var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: cardWidth))]) {
      ForEach(emojis.indices, id: \.self) { index in
        CardView(content: emojis[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundColor(color)
  }
  
  private func generateThemeButton(
    contents: [String],
    color: Color,
    imageName: String,
    subtitle: String
  ) -> some View {
    return Button(action: {
      let randomNumbers = Int.random(in: 0..<contents.count)
      let randomEmojis = contents[0...randomNumbers] + contents[0...randomNumbers]
      
      emojis = randomEmojis.shuffled()
      self.color = color
    }, label: {
      VStack {
        Image(systemName: imageName)
          .imageScale(.large)
        Text(subtitle)
          .font(.caption)
      }
    })
  }
  
  private var holloweenThemeButton: some View {
    generateThemeButton(
      contents: ["👻", "🕸️", "🧙", "🙀", "😱", "🍭"],
      color: .orange,
      imageName: "suit.heart.fill",
      subtitle: "Halloween"
    )
  }
  
  private var fruitThemeButton: some View {
    generateThemeButton(
      contents: ["🍑", "🍓"],
      color: .blue,
      imageName: "basket.fill",
      subtitle: "Fruit"
    )
  }
  
  private var vehicleThemeButton: some View {
    generateThemeButton(
      contents: ["✈️", "🚀", "🚗", "🛵"],
      color: .red,
      imageName: "car.fill",
      subtitle: "Vehicle"
    )
  }
  
  private var cardWidth: CGFloat {
    let maxWidth: CGFloat = 150.0
    let minWidth: CGFloat = 40.0
    let scaledWidth = maxWidth - CGFloat(emojis.count) * 8

    return max(minWidth, min(scaledWidth, maxWidth))
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      
      base.fill()
        .opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

#Preview {
  ContentView()
}
