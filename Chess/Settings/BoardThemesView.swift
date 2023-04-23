//
//  BoardThemesView.swift
//  Chess
//
//  Created by Kaushal
//

import SwiftUI

struct BoardThemesView: View {
  @ObservedObject
  var viewModel: BoardThemesViewModel = BoardThemesViewModel()

  var body: some View {
    List {
      ForEach(viewModel.themes) { theme in
        BoardThemeCell(theme: theme)
      }
    }
  }
}

struct BoardThemesView_Previews: PreviewProvider {
    static var previews: some View {
        BoardThemesView()
    }
}
