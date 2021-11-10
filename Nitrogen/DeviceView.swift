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
    Form {
      Section(header: Text("Hardware Info")) {
        HStack {
          Label("Device identifier:", systemImage: "iphone")
          Spacer()
          Text("\(machineName())")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
        HStack {
          Label("Memory:", systemImage: "memorychip.fill")
          Spacer()
          Text("\(totalMem) Bytes")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
        HStack {
          Label("Processor Cores:", systemImage: "memorychip.fill")
          Spacer()
          Text("\(totalCores)")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
        HStack {
          Label("Device is simulator:", systemImage: "laptopcomputer")
          Spacer()
          Text("\(String((isSimulator)))")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
      }
      Section(header: Text("Software info")) {
        HStack {
          Label("System Name:", systemImage: "iphone")
          Spacer()
          Text("\(sysName())")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
//        HStack {
//          Label("Kernel Version:", systemImage: "iphone")
//          Spacer()
//          Text("\(deviceVersion())")
//            .multilineTextAlignment(.trailing)
//            .foregroundColor(.gray)
//            .font(.system(.body, design: .monospaced))
//        }
        HStack {
          Label("OS Version String:", systemImage: "iphone")
          Spacer()
          Text("\(OSVer)")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
        HStack {
          Label("Uptime:", systemImage: "clock.fill")
          Spacer()
          Text("\(uptime)")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
        HStack {
          Label("Hostname:", systemImage: "network")
          Spacer()
          Text("\(hostName)")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .font(.system(.body, design: .monospaced))
        }
      }
    }
    .navigationTitle("Device")
  }
}


