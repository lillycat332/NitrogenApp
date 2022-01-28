//
//  BatteryTestView.swift
//  BatteryTestView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI



struct BatteryTestView: View {
  var body: some View {
    VStack {
      List {
        Section(header: Text("Battery Info"), footer: Text("To access battery health, look in settings or a program like coconutBattery.")) {
          FormView(label: "Battery Level", symbol: "battery.100", value: "\(batteryPercent)%")
          FormView(label: "Battery State", symbol: "battery.100.bolt", value: "\(batteryIsCharging)")
        }
      }
    }
    .navigationTitle("Battery Information")
  }
}
