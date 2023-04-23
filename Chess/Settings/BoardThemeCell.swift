//
//  BoardThemeCell.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct BoardThemeCell: View {
  @State var theme: BoardTheme

  var body: some View {
    Text(theme.title)
    HStack {
      SquareView(type: .light, theme: theme)
        .aspectRatio(contentMode: .fit)
      SquareView(type: .dark, theme: theme)
        .aspectRatio(contentMode: .fit)
      SquareView(type: .light, theme: theme)
        .aspectRatio(contentMode: .fit)
      SquareView(type: .dark, theme: theme)
        .aspectRatio(contentMode: .fit)
    }
  }
}
