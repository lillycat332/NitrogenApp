 //
 //  ContentView.swift
 //  Nitrogen
 //
 //  Created by Lilly Cham on 15/10/2021.
 //

import SwiftUI
import Combine

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink(destination: DeviceView()) {
            Label("Device", systemImage: "ipad")
          }
          NavigationLink(destination: BatteryTestView()) {
            Label("Battery", systemImage: "battery.75")
          }
        }
        
        Section {
          NavigationLink(destination: HelpView()) {
            Label("Help", systemImage: "questionmark")
          }
          NavigationLink(destination: AboutView()) {
            Label("About Nitrogen", systemImage: "command")
          }

          
          NavigationLink(destination: LicenseView()) {
            Label("View License", systemImage: "doc.on.doc.fill")
          }
        }
        
      }
      .navigationBarTitle(Text("Nitrogen"))
      .navigationTitle("Home")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

