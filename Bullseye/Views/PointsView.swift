//
//  ModalView.swift
//  Bullseye
//
//  Created by Josiah Pilon on 2023-04-07.
//

import SwiftUI

struct PointsView: View {
  @Binding var sliderValue: Double
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)

    VStack (spacing: 10) {
      InstructionText(text: "the sliders value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) Points \n 🎉🎉🎉")
      Button {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21)
    .shadow(radius: 10, x: 5, y: 5)
  }

  struct ModalView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())

    static var previews: some View {
      PointsView(sliderValue: sliderValue, game: game, alertIsVisible: alertIsVisible)
      PointsView(sliderValue: sliderValue, game: game, alertIsVisible: alertIsVisible)
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeRight)
    }
  }
}
