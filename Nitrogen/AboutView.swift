//
//  AboutView.swift
//  AboutView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct AboutView: View{
  var version = "0.3.4"
  var body: some View {
    VStack {
      List {
        Section {
          Label("Version number: \(version)", systemImage: "arrow.down.app.fill")
          Label("compiledForSim: \(String((compiledForSim)))", systemImage: "laptopcomputer")
        }
      }
    }
    .navigationTitle("About Nitrogen")
  }
  
}
