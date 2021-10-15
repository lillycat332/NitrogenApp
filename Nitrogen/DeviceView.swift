//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct DeviceView: View{
  var body: some View {
    VStack {
      List {
        Section {
          Label("Device identifier: \(machineName())", systemImage: "iphone")
          Label("System Name: \(sysName())", systemImage: "iphone")
          Label("Version: \(deviceVersion())", systemImage: "iphone")
        }
      }
    }
    .navigationTitle("Device")
  }
}

