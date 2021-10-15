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
    ScrollView {
      Text(
    """
    Nitrogen is a specs and tests app for iOS Devices.
    """
      )
        .padding()
        .navigationTitle("About Nitrogen")
    }
  }
  
}
