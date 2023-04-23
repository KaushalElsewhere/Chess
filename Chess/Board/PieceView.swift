//
//  PieceView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct PieceView: View {
  let image: UIImage

  var body: some View {
    Image(uiImage: image)
  }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
      PieceView(image: UIImage(systemName: "pawprint.circle")!)
    }
}
