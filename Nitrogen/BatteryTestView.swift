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
          HStack {
            Label("Battery Level:", systemImage: "battery.100")
            Spacer()
            Text("\(Int(batteryPercent))%")
              .multilineTextAlignment(.trailing)
              .foregroundColor(.gray)
              .font(.system(.body, design: .monospaced))
          }
          HStack {
            Label("Battery State:", systemImage: "battery.100.bolt")
            Spacer()
            Text("\(batteryIsCharging)")
              .multilineTextAlignment(.trailing)
              .foregroundColor(.gray)
              .font(.system(.body, design: .monospaced))
          }
        }
      }
    }
    .navigationTitle("Battery Information")
  }
}
