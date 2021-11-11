//
//  ContentView.swift
//  Nitrogen
//
//  Created by Lilly Cham on 15/10/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("About this Device")) {
          NavigationLink(destination: DeviceView()) {
            Label("Device", systemImage: "ipad")
          }
          NavigationLink(destination: BatteryTestView()) {
            Label("Battery", systemImage: "battery.75")
          }
        }
        
        Section(header: Text("Information")) {
          NavigationLink(destination: HelpView()) {
            Label("Help", systemImage: "questionmark.circle.fill")
          }
          NavigationLink(destination: AboutView()) {
            Label("About Nitrogen", systemImage: "command")
          }
        }
        
      }
      .navigationTitle(Text("Nitrogen"))
      DeviceView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 15.0, *) {
      ContentView()
        .previewInterfaceOrientation(.landscapeRight)
    } else {
      // Fallback on earlier versions
    }
  }
}

