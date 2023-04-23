//
//  TabbarView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct RootView: View {
  var body: some View {
    TabView {

      // 1.
      BoardView()
        .tabItem {
          Label("Board", systemImage: "checkerboard.rectangle")
        }

      // 2.
      NavigationView {
        SettingsView()
          .navigationTitle("Settings")
      }.tabItem {
        Label("Settings", systemImage: "gear")
      }
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
