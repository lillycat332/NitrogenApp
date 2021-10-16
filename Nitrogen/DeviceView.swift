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
          Label("Memory: \(totalMem) Bytes", systemImage: "memorychip.fill")
          Label("Processor Cores: \(totalCores)", systemImage: "memorychip.fill")
          Label("Device is simulator: \(String((isSimulator)))", systemImage: "laptopcomputer")
        }
        
        Section{
          Label("System Name: \(sysName())", systemImage: "iphone")
          Label("Kernel Version: \(deviceVersion())", systemImage: "iphone")
          Label("OS Version String: \(OSVer)", systemImage: "iphone")
          Label("Uptime: \(uptime)", systemImage: "iphone")
          Label("Hostname: \(hostName)", systemImage: "iphone")
        }
      }
    }
    .navigationTitle("Device")
  }
}

