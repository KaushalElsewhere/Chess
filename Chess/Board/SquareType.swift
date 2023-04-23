//
//  SquareType.swift
//  Chess
//
//  Created by Kaushal on  .
//

import Foundation

enum SquareType {
  case dark
  case light

  init(index: Int) {
    let x = index % 8
    let y = index / 8

    if x % 2 == 0 {
      if y % 2 == 0 {
        self = .light
      } else {
        self = .dark
      }
    } else {
      if y % 2 == 0 {
        self = .dark
      } else {
        self = .light
      }
    }
  }
}
