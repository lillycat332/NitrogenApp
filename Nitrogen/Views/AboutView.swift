//
//  AboutView.swift
//  AboutView
//
//  Created by Lilly Cham on 15/10/2021.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    Form {
      Section (header: Text("Open Source")) {
        NavigationLink(destination: LicenseView()) {
          Label("View Licenses", systemImage: "doc.text.fill")
        }
        Link(destination: URL(string: "https://github.com/lillycat332/NitrogenApp")!) {
          Label("GitHub Repo", systemImage: "ellipsis.curlybraces")
        }
      }
      .navigationTitle("About")
    }
  }
}
