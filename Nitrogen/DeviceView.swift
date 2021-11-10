//
//  DeviceView.swift
//  DeviceView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI

// (label: String, symbol: String, value : Int)
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


struct DeviceView: View{
  var body: some View {
    Form {
      Section(header: Text("Hardware Info")) {
        FormView(label: "Device Identifier", symbol: "iphone", value: machineName())
        FormView(label: "RAM", symbol: "memorychip.fill", value: "\(totalMem)")
        FormView(label: "Processor Cores", symbol: "memorychip.fill", value: "\(totalCores)")
        HStack {
          Label("Device is simulator", systemImage: "laptopcomputer")
          Spacer()
          Text("\(String((isSimulator)))")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
      }
      Section(header: Text("Software info")) {
        FormView(label: "System Name", symbol: "iphone", value: sysName())
        FormView(label: "OS Version", symbol: "textformat.123", value: OSVer)
        FormView(label: "Uptime", symbol: "clock.fill", value: "\(uptime)")
        FormView(label: "Hostname", symbol: "network", value: hostName)
        // FormView(label: "Kernel Version", symbol: "iphone", value: "\(deviceVersion())")
      }
    }
    .navigationTitle("Device")
  }
}


