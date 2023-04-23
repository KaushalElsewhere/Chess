//
//  SettingsView.swift
//  Chess
//
//  Created by Kaushal on  .
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
      List {
        Section {
          NavigationLink {
            BoardThemesView()
          } label: {
            Text("Board themes")
          }
        }

        Section {
          Text("About")
        }
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
