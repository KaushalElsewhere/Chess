//
//  UserSettings.swift
//  Chess
//
//  Created by Kaushal on  .
//

import Foundation

final class UserSettings {
  static let shared = UserSettings()

  private init() {}

  var currentTheme: BoardTheme = BoardTheme(title: "Brown",
                                            lightColor: #colorLiteral(red: 0.9388540983, green: 0.8536507487, blue: 0.7090491652, alpha: 1),
                                            darkColor: #colorLiteral(red: 0.7082098126, green: 0.5318915844, blue: 0.3869944215, alpha: 1))
}
