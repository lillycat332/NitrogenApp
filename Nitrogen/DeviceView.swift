//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

// (label: String, symbol: String, value : String)
struct FormView : View {
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
  var body: some View {
    Form {
      Section(header: Text("Hardware Info"), footer: Text("Hardware refers to the physical components of your device.")) {
        FormView(label: "Model", symbol: "ipad.and.iphone", value: "\(modelName) (\(machineName()))")
        FormView(label: "SoC", symbol: "cpu.fill", value: "\(totalCores) Core \(CPUinfoStr)")
        FormView(label: "RAM", symbol: "memorychip.fill", value: "\(totalMem) GiB")
        FormView(label: "Storage Size", symbol: "internaldrive.fill", value: "\(totalDiskGB)")
        FormView(label: "Device is Simulator", symbol: "laptopcomputer", value: "\(isSimulator)")
      }
      Section(header: Text("Software info"), footer: Text("Software refers to the programs and systems that run on your device.")) {
        FormView(label: "OS", symbol: "folder.fill.badge.gearshape", value: "\(OSVer)")
        FormView(label: "Kernel", symbol: "hammer.fill", value: "\(sysName()) \(kernelVersion())")
        FormView(label: "Uptime", symbol: "clock.fill", value: "\(uptimeParsed)")
        FormView(label: "Hostname", symbol: "network", value: hostName)
      }
    }
    .navigationTitle("Device")
  }
}
