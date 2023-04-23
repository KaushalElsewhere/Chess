//
//  BoardView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct BoardView: View {
  @ObservedObject
  var viewModel: CoordinateViewModel = CoordinateViewModel(boardWidth: UIScreen.main.bounds.width)

  var body: some View {
    VStack {
      CoordinateView(theme: UserSettings.shared.currentTheme,
                     viewModel: viewModel)
          //.padding(8)

      Button {
        ///viewModel.move()
      } label: {
        Text("Move")
      }
    }

  }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
