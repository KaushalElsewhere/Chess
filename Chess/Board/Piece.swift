//
//  Piece.swift
//  Chess
//
//  Created by Kaushal on 24/6/2022.
//

import Foundation

enum PieceType {
  case pawn
  case rook
  case knight
  case bishop
  case queen
  case king
}

class Piece: Identifiable, Equatable {
  let id: UUID = UUID()

  let type: PieceType
  let player: Player

  init(type: PieceType, player: Player) {
    self.type = type
    self.player = player
  }

  static func == (lhs: Piece, rhs: Piece) -> Bool {
    lhs.id == rhs.id
  }
}

extension Piece {
  var imageName: String {
    let prefix = "Alpha"
    let color = player == .white ? "W" : "B"

    switch type {
    case .pawn: return  prefix + color + "Pawn"
    case .rook: return prefix + color + "Rook"
    case .knight: return prefix + color + "Knight"
    case .bishop: return prefix + color + "Bishop"
    case .queen: return prefix + color + "Queen"
    case .king: return prefix + color + "King"
    }
  }
}

enum Player {
    case white
    case black
}

struct Position {
  let x: Int
  let y: Int
}

func +(lhs: Position, rhs: Position) -> Position {
    return Position(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

struct Move {
  let start: Position
  let end: Position
}
