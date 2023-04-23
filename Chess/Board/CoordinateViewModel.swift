//
//  CoordinateViewModel.swift
//  Chess
//
//  Created by Kaushal on 23/6/2022.
//

import Foundation
import UIKit

final class CoordinateViewModel: ObservableObject {

  private let boardWidth: CGFloat
  let interactor = GameInteractor()

  init(boardWidth: CGFloat) {
    self.boardWidth = boardWidth
  }

  @Published
  var pieces: [Piece?] = [

    Piece(type: .rook, player: .black),
    Piece(type: .knight, player: .black),
    Piece(type: .bishop, player: .black),
    Piece(type: .queen, player: .black),
    Piece(type: .king, player: .black),
    Piece(type: .bishop, player: .black),
    Piece(type: .knight, player: .black),
    Piece(type: .rook, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    Piece(type: .pawn, player: .black),
    nil, nil, nil, nil, nil, nil, nil, nil,
    nil, nil, nil, nil, nil, nil, nil, nil,
    nil, nil, nil, nil, nil, nil, nil, nil,
    nil, nil, nil, nil, nil, nil, nil, nil,
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .pawn, player: .white),
    Piece(type: .rook, player: .white),
    Piece(type: .knight, player: .white),
    Piece(type: .bishop, player: .white),
    Piece(type: .queen, player: .white),
    Piece(type: .king, player: .white),
    Piece(type: .bishop, player: .white),
    Piece(type: .knight, player: .white),
    Piece(type: .rook, player: .white)
  ]

}

extension CoordinateViewModel {

  func position(at translation: CGSize) -> Position {
    Position(
      x: Int((translation.width / (boardWidth / 8)).rounded()),
      y: Int((translation.height / (boardWidth / 8)).rounded()))
  }

  func position(of piece: Piece) -> Position {
    if let index = pieces.firstIndex(of: piece) {
      return Position(x: index % 8, y: index / 8)
    }

    fatalError("Position can't found")
  }

  func offset(of piece: Piece) -> CGSize {
    let position = position(of: piece)

    let width = CGFloat(position.x) * CGFloat(boardWidth / 8)
    let height = CGFloat(position.y) * CGFloat(boardWidth / 8)
    let size = CGSize(width: width, height: height)

    return size
  }

  func didMove(_ move: Move) {
    let startIndex = (move.start.y * 8) + move.start.x
    let endIndex = (move.end.y * 8) + move.end.x

    pieces[endIndex] = pieces[startIndex]
    pieces[startIndex] = nil
  }



  func onAppear() {
    interactor.analyse()
  }


  /*
  private func indexFromLocation(_ point: CGPoint) -> Int {
    /*
     File f = File(point.x / sqSize);
     Rank r = Rank((8*sqSize - point.y) / sqSize);
     return (file_is_ok(f) && rank_is_ok(r))? make_square(f, r)
     */

    let sqrSize = boardSize.width / 8

    let file = ceil(point.x / sqrSize)
    let rank = ceil(point.y / sqrSize)

    let index = (Int(file) * Int(rank)) - 1
    return index
  }*/
}
