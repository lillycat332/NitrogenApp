//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

struct InfoItem : View {
  /// InfoItem displays label, symbol and description as a HStack containing a Label(label), a Spacer(), and Text(description), to be used eg. inside a Form { ... }
  @State var label: String = ""
  @State var symbol: String = ""
  @State var description: String = ""
  var body: some View {
    HStack {
      Label(label, systemImage: symbol)
      Spacer()
      Text(description)
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
      Section(header: Text("Hardware Info"), footer: Text(hwMessage)) {
        InfoItem(label: "Model", symbol: "ipad.and.iphone", description: "\(modelName) (\(machineName()))")
        InfoItem(label: "SoC", symbol: "cpu.fill", description: "\(totalCores) Core \(CPUinfoStr)")
        InfoItem(label: "RAM", symbol: "memorychip.fill", description: "\(totalMem) GiB")
        InfoItem(label: "Storage Size", symbol: "internaldrive.fill", description: "\(totalDiskGB)")
        InfoItem(label: "Device is Simulator", symbol: "laptopcomputer", description: "\(isSimulator)")
      }
      
      Section(header: Text("Software info"), footer: Text(swMessage)) {
        InfoItem(label: "OS", symbol: "folder.fill.badge.gearshape", description: "\(OSVer)")
        InfoItem(label: "Kernel", symbol: "hammer.fill", description: "\(sysName()) \(kernelVersion())")
        InfoItem(label: "Uptime", symbol: "clock.fill", description: "\(uptimeParsed)")
        InfoItem(label: "Hostname", symbol: "network", description: hostName)
      }
    }
    .navigationTitle("Device")
  }
}

struct DeviceView_Previews: PreviewProvider {
  static var previews: some View {
    DeviceView()
  }
}
