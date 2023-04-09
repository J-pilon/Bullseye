//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Josiah Pilon on 2023-04-06.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedRectTextView: View {
  var text: String

  var body: some View {
    Text(String(text))
      .kerning(-0.2)
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct RoundedTextView: View {
  var text: String

  var body: some View {
    Text(String(text))
      .font(.title3)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
      .background (
        Circle()
          .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "list.dash")
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedRectTextView(text: "0")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
