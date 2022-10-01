//
//  helpView.swift
//  helpView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct HelpView: View {
  var body: some View {
    Form {
      Section (header: Text("Hardware Terminology")) {
        NavigationLink(destination: ContentView()) {
          Label("Storage", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("SoC", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("RAM", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("Storage", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
      }
      Section (header: Text("Software Terminology")) {
        NavigationLink(destination: ContentView()) {
          Label("OS", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("Kernel", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("Uptime", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
        NavigationLink(destination: ContentView()) {
          Label("Hostname", systemImage: "doc.text.fill")
            .labelStyle(.titleOnly)
        }
      }
      .navigationTitle("About")
    }
  }
}

struct HelpView_Previews: PreviewProvider {
  static var previews: some View {
    HelpView()
  }
}
