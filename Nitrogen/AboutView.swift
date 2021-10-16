//
//  AboutView.swift
//  AboutView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct AboutView: View{
  var body: some View {
    VStack {
      List {
        Section {
          Label("compiledForSim: \(String((compiledForSim)))", systemImage: "laptopcomputer")
        }
      }
    }
    .navigationTitle("About Nitrogen")
  }
  
}
