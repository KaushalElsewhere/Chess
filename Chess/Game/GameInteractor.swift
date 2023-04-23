//
//  GameInteractor.swift
//  Chess
//
//  Created by Kaushal on  .
//

import Foundation
import Stockfish

final class GameInteractor: NSObject {
  let someGameFen =
  "position fen rnbqkbnr/pppp1ppp/8/4p3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq -"

  let engine = EngineManager()

  override init() {
    super.init()
    setup()
  }

  private func setup() {
    engine.delegate = self
    engine.gameFen = someGameFen
  }

  func analyse() {
    engine.startAnalyzing()

    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4), execute: {
      self.engine.stopAnalyzing()
    })
  }
}

extension GameInteractor: EngineManagerDelegate {
  func engineManager(_ engineManager: EngineManager,
                     didReceiveBestMove bestMove: String?,
                     ponderMove: String?) {
    print("BestMove: ", bestMove)
    print("PonderMove: ", ponderMove)
  }
}
