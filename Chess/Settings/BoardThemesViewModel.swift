//
//  BoardThemesViewModel.swift
//  Chess
//
//  Created by Kaushal on  .
//

import Foundation
import SwiftUI

final class BoardThemesViewModel: ObservableObject {
  @Published var themes: [BoardTheme] = [
    BoardTheme(title: "Blue",
               lightColor: #colorLiteral(red: 0.8711747527, green: 0.8906508088, blue: 0.9034172893, alpha: 1),
               darkColor: #colorLiteral(red: 0.5493699908, green: 0.6332333684, blue: 0.6797143817, alpha: 1)),
    BoardTheme(title: "Brown",
               lightColor: #colorLiteral(red: 0.9388540983, green: 0.8536507487, blue: 0.7090491652, alpha: 1),
               darkColor: #colorLiteral(red: 0.7082098126, green: 0.5318915844, blue: 0.3869944215, alpha: 1)),
    BoardTheme(title: "Purple",
               lightColor: #colorLiteral(red: 0.878798902, green: 0.8325570226, blue: 0.9161525369, alpha: 1),
               darkColor: #colorLiteral(red: 0.6030774117, green: 0.4901425242, blue: 0.7087444663, alpha: 1))
  ]
}

struct BoardTheme: Identifiable {
  let id = UUID()

  let title: String
  let lightColor: UIColor
  let darkColor: UIColor
}
