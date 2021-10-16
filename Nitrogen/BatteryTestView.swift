//
//  BatteryTestView.swift
//  BatteryTestView
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import SwiftUI



struct BatteryTestView: View{
  var body: some View {
    VStack {
      List{
        Section(header: Text("Battery Info")) {
          Label("Battery Level: \(Int(batteryPercent))%", systemImage: "battery.100")
          Label("Battery State: \(batteryIsCharging)", systemImage: "battery.100")
        }
      }
    }
    .navigationTitle("Battery Information")
  }
}
