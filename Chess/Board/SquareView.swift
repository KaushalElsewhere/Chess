//
//  SquareView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct SquareView: View {
  let type: SquareType
  var theme: BoardTheme? = nil

  var body: some View {
    ZStack {
      color()
    }
  }

  func color() -> Color {
    if let theme = theme {
      switch type {
      case .light:
        return Color(theme.lightColor)
      case .dark:
        return Color(theme.darkColor)
      }
    }

    switch type {
    case .light:
      return Color.white
    case .dark:
      return Color.gray
    }
  }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
      SquareView(type: .dark)
    }
}
