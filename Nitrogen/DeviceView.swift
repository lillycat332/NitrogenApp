//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI
//import DeviceKit <- not working atm

struct DeviceView: View{
  var body: some View {
    NavigationView {
      List {
        Section {
          Label("Device identifier: \(machineName())", systemImage: "iphone")
          Label("System Name: \(sysName())", systemImage: "iphone")
          Label("Version: \(deviceVersion())", systemImage: "iphone")
        }
        Section{
          Label("Device identifier: \(machineName())", systemImage: "iphone")
          Label("System Name: \(sysName())", systemImage: "iphone")
          Label("Version: \(deviceVersion())", systemImage: "iphone")
        }
      }
    }
    .navigationTitle("Device")
  }
}

