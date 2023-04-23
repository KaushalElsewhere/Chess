//
//  CoordinateView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct CoordinateView: View {
  private let columns: [GridItem] = Array(
    repeating: GridItem(.flexible(), spacing: 0),
    count: 8)
  let theme: BoardTheme

  @State
  private var currentPiece: (piece: Piece?, offset: CGSize) = (nil, .zero)

  @ObservedObject
  var viewModel: CoordinateViewModel

  var body: some View {
    ZStack(alignment: .topLeading) {
      boardView
      piecesView
    }
    .onAppear {
      viewModel.onAppear()
    }
  }

  @ViewBuilder
  var boardView: some View {
    LazyVGrid(columns: columns, spacing: 0) {
      ForEach(0..<64) { index in
        SquareView(type: SquareType(index: index), theme: theme)
          .aspectRatio(contentMode: .fit)
      }
    }
  }

  @ViewBuilder
  var piecesView: some View {
    ForEach(viewModel.pieces.compactMap { $0 }) { piece in
      PieceView(image: UIImage(named: piece.imageName)!)
        .aspectRatio(contentMode: .fit)
        .offset(currentPiece.piece == piece ? currentPiece.offset : viewModel.offset(of: piece))
        .gesture(dragGesture(piece))
    }
    .coordinateSpace(name: "board")
  }

  func dragGesture(_ piece: Piece) -> some Gesture {
    DragGesture(coordinateSpace: .named("board"))
      .onChanged { gesture in
        currentPiece = (piece, viewModel.offset(of: piece) + gesture.translation)
      }
      .onEnded { gesture in
        withAnimation(.easeInOut(duration: 0.2)) {

          currentPiece = (nil, .zero)

          let start = viewModel.position(of: piece)
          let end = start + viewModel.position(at: gesture.translation)
          let move = Move(start: start, end: end)
          viewModel.didMove(move)
        }
      }
  }
}
