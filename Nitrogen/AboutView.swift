//
//  AboutView.swift
//  AboutView
//
//  Created by Lilly Cham on 15/10/2021.
//

import SwiftUI

struct AboutView: View{
  var body: some View {
      List {
        NavigationLink(destination: LicenseView()) {
          Label("View Licenses", systemImage: "doc.on.doc.fill")
        }
    }
    .navigationTitle("About")
  }
  
}
