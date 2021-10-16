//
//  SpecGetter.swift
//  SpecGetter
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import UIKit.UIDevice

func machineName() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.machine)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

func sysName() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.sysname)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

func deviceVersion() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.version)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

func sysInfo() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

var batteryPercent: Float {
  UIDevice.current.isBatteryMonitoringEnabled = true
  return (UIDevice.current.batteryLevel * 100)
}

var batteryIsCharging: String {
  UIDevice.current.isBatteryMonitoringEnabled = true
  var batteryState: UIDevice.BatteryState { UIDevice.current.batteryState }
  switch batteryState {
  case .unplugged:
    return "Not Charging"
  case .unknown:
    return "Unknown"
  case .charging:
    return "Charging"
  case .full:
    return "Full"
  @unknown default:
    return "UnknVown"
  }
}

var totalMem: UInt64 {
  return ProcessInfo.processInfo.physicalMemory
}

var totalCores: Int {
  return ProcessInfo.processInfo.processorCount
}

var OSVer : String {
  return ProcessInfo.processInfo.operatingSystemVersionString
}

var hostName : String {
  return ProcessInfo.processInfo.hostName
}

var uptime : TimeInterval {
  return ProcessInfo.processInfo.systemUptime
}

var isSimulator: Bool {
  return TARGET_OS_SIMULATOR != 0
}