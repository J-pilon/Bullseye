//
//  Game.swift
//  Bullseye
//
//  Created by Josiah Pilon on 2023-04-06.
//
//  models are data models
//  option-click

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderBoardEntries: [LeaderBoardEntry] = []

  init(loadTestDate: Bool = false) {
    addToLeaderboard(score: 100)
    addToLeaderboard(score: 50)
    addToLeaderboard(score: 300)
    addToLeaderboard(score: 150)
    addToLeaderboard(score: 10)
  }

//  (parameterName: value)
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    var bonus: Int

    if (difference == 0) {
      bonus = 100
    } else if (difference <= 2) {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }

  mutating func startNewRound(points: Int) {
    addToLeaderboard(score: points)
    score += points
    round += 1
    target = Int.random(in: 1...100)
  }

  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }

  mutating func addToLeaderboard(score: Int) {
    leaderBoardEntries.append(LeaderBoardEntry(score: score, date: Date()))
    leaderBoardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }
}

struct LeaderBoardEntry {
  let score: Int
  let date: Date
}
