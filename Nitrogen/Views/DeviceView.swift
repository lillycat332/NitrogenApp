//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct DeviceDataView : View {
  // parses the variables into hstack for form
  @State var label: String = ""
  @State var symbol: String = ""
  @State var value: String = ""
  var body: some View {
    HStack {
      Label(label, systemImage: symbol)
      Spacer()
      Text(value)
        .multilineTextAlignment(.trailing)
        .foregroundColor(.gray)
        .font(.system(.body, design: .monospaced))
    }
  }
}

struct DeviceView: View {
  // main view
  var body: some View {
    Form {
      Section(header: Text("Hardware Info"), footer: Text("Hardware refers to the physical components of your device.")) {
        DeviceDataView(label: "Model", symbol: "ipad.and.iphone", value: "\(modelName) (\(machineName()))")
        DeviceDataView(label: "SoC", symbol: "cpu.fill", value: "\(totalCores) Core \(CPUinfoStr)")
        DeviceDataView(label: "RAM", symbol: "memorychip.fill", value: "\(totalMem) GiB")
        DeviceDataView(label: "Storage Size", symbol: "internaldrive.fill", value: "\(totalDiskGB)")
        DeviceDataView(label: "Device is Simulator", symbol: "laptopcomputer", value: "\(isSimulator)")
      }
      
      Section(header: Text("Software info"), footer: Text("Software refers to the programs and systems that run on your device.")) {
        DeviceDataView(label: "OS", symbol: "folder.fill.badge.gearshape", value: "\(OSVer)")
        DeviceDataView(label: "Kernel", symbol: "hammer.fill", value: "\(sysName()) \(kernelVersion())")
        DeviceDataView(label: "Uptime", symbol: "clock.fill", value: "\(uptimeParsed)")
        DeviceDataView(label: "Hostname", symbol: "network", value: hostName)
      }
    }
    .navigationTitle("Device")
  }
}
