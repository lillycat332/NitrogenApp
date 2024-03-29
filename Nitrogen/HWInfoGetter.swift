//
//  HWInfoGetter.swift
//  HWInfoGetter
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation
import UIKit.UIDevice

// Functions

func parseSeconds(seconds: Int) -> (String) {
  return ("\(seconds / 86400)D, \(seconds / 3600)H, \((seconds % 3600) / 60)M, \((seconds % 3600) % 60)S")
}

// Hardware getters

var isSimulator: Bool {
  return TARGET_OS_SIMULATOR != 0
}

var modelName: String {
  return UIDevice.modelName
}

func machineName() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.machine)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

var totalDiskBytes: Int64 {
  guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
        let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
  return space
}

var totalDiskGB: String {
  return ByteCountFormatter.string(fromByteCount: totalDiskBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
}

var totalMem: Float {
  return Float(ProcessInfo.processInfo.physicalMemory) / 1024.0 / 1024.0 / 1024.0
}

var totalCores: Int {
  return ProcessInfo.processInfo.processorCount
}

// CPU Info stuff

// I found this on SO: https://stackoverflow.com/a/65288195/
// Making this lookup table would have been a huge PitA, so thanks to the guy that did it.

func CPUinfo() -> [String: String] {
#if targetEnvironment(simulator)
  let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
#else

  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.machine)
  let identifier = machineMirror.children.reduce("") { identifier, element in
    guard let description = element.1 as? Int8, description != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(description)))
  }
#endif

  // Removed all the older stuff too.
  switch identifier {
  // iPod Touch
  case "iPod9,1": return ["A10": "1.63 GHz"]
  // iPhone
  case "iPhone8,1": return ["A9": "1.85 GHz"]
  case "iPhone8,2": return ["A9": "1.85 GHz"]
  case "iPhone9,1",
       "iPhone9,3": return ["A10": "2.34 GHz"]
  case "iPhone9,2",
       "iPhone9,4": return ["A10": "2.34 GHz"]
  case "iPhone8,4": return ["A9": "1.85 GHz"]
  case "iPhone10,1",
       "iPhone10,4": return ["A11": "2.39 GHz"]
  case "iPhone10,2",
       "iPhone10,5": return ["A11": "2.39 GHz"]
  case "iPhone10,3",
       "iPhone10,6": return ["A11": "2.39 GHz"]
  case "iPhone11,2",
       "iPhone11,4",

       "iPhone11,6",
       "iPhone11,8": return ["A12": "2.5 GHz"]
  case "iPhone12,1",
       "iPhone12,3",

       "iPhone12,5": return ["A13": "2650 GHz"]
  case "iPhone12,8": return ["A13": "2.65 GHz"]
  case "iPhone13,2",
    "iPhone13,1",
    "iPhone13,3": return ["A14": "2.99 GHz"]
  case "iPhone13,4": return ["A14": "3.1 GHz"]
  case "iPhone14,8",
       "iPhone14,7",
       "iPhone14,6",
       "iPhone14,5",
       "iPhone14,4",
       "iPhone14,2",
       "iPhone14,3": return ["A15": "3.22 GHz"]
    case "iPhone15,2",
    "iPhone15,3": return ["A16":"3.46 GHz"]
  // iPad
  case "iPad6,3", "iPad6,4": return ["A9X": "2.16 GHz"]
  case "iPad6,7", "iPad6,8": return ["A9X": "2.24 GHz"]
  case "iPad7,1", "iPad7,2",
       "iPad7,3", "iPad7,4": return ["A10X": "2.34 GHz"]
  case "iPad8,1", "iPad8,2",
       "iPad8,3", "iPad8,4": return ["A12X": "2.5 GHz"]
  case "iPad8,5", "iPad8,6",
       "iPad8,7", "iPad8,8",
       "iPad8,9", "iPad8,10",
       "iPad8,11", "iPad8,12": return ["A12Z": "2.5 GHz"]
  case "iPad13,1", "iPad13,2": return ["A14": "3.1 GHz"]
  case "iPad13,4",
       "iPad13,5",
       "iPad13,6",
       "iPad13,7",
       "iPad13,8",
       "iPad13,9",
       "iPad13,10",
       "iPad13,11",
    "iPad13,16",
    "iPad13,17": return ["M1": "3.1 GHz"]
    case "iPad14,1",
    "iPad14,2": return ["A15":"3.6 GHz"]

  default: return ["Unknown": "? GHz"]
  }
}

var CPUinfoStr: String = CPUinfo().map { $0.0 + " @ " + $0.1 }.joined(separator: " ")

// The same for this, which was taken from here https://stackoverflow.com/a/26962452/

public extension UIDevice {
  static let modelName: String = {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }

    func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
#if os(iOS)
      switch identifier {
      case "iPod5,1": return "iPod touch (5th generation)"
      case "iPod7,1": return "iPod touch (6th generation)"
      case "iPod9,1": return "iPod touch (7th generation)"
      case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
      case "iPhone4,1": return "iPhone 4s"
      case "iPhone5,1", "iPhone5,2": return "iPhone 5"
      case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
      case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
      case "iPhone7,2": return "iPhone 6"
      case "iPhone7,1": return "iPhone 6 Plus"
      case "iPhone8,1": return "iPhone 6s"
      case "iPhone8,2": return "iPhone 6s Plus"
      case "iPhone8,4": return "iPhone SE"
      case "iPhone9,1", "iPhone9,3": return "iPhone 7"
      case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
      case "iPhone10,1", "iPhone10,4": return "iPhone 8"
      case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
      case "iPhone10,3", "iPhone10,6": return "iPhone X"
      case "iPhone11,2": return "iPhone XS"
      case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
      case "iPhone11,8": return "iPhone XR"
      case "iPhone12,1": return "iPhone 11"
      case "iPhone12,3": return "iPhone 11 Pro"
      case "iPhone12,5": return "iPhone 11 Pro Max"
      case "iPhone12,8": return "iPhone SE (2nd generation)"
      case "iPhone13,1": return "iPhone 12 mini"
      case "iPhone13,2": return "iPhone 12"
      case "iPhone13,3": return "iPhone 12 Pro"
      case "iPhone13,4": return "iPhone 12 Pro Max"
      case "iPhone14,4": return "iPhone 13 mini"
      case "iPhone14,5": return "iPhone 13"
      case "iPhone14,2": return "iPhone 13 Pro"
      case "iPhone14,3": return "iPhone 13 Pro Max"
      case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
      case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad (3rd generation)"
      case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad (4th generation)"
      case "iPad6,11", "iPad6,12": return "iPad (5th generation)"
      case "iPad7,5", "iPad7,6": return "iPad (6th generation)"
      case "iPad7,11", "iPad7,12": return "iPad (7th generation)"
      case "iPad11,6", "iPad11,7": return "iPad (8th generation)"
      case "iPad12,1", "iPad12,2": return "iPad (9th generation)"
      case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
      case "iPad5,3", "iPad5,4": return "iPad Air 2"
      case "iPad11,3", "iPad11,4": return "iPad Air (3rd generation)"
      case "iPad13,1", "iPad13,2": return "iPad Air (4th generation)"
      case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad mini"
      case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad mini 2"
      case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad mini 3"
      case "iPad5,1", "iPad5,2": return "iPad mini 4"
      case "iPad11,1", "iPad11,2": return "iPad mini (5th generation)"
      case "iPad14,1", "iPad14,2": return "iPad mini (6th generation)"
      case "iPad6,3", "iPad6,4": return "iPad Pro (9.7-inch)"
      case "iPad7,3", "iPad7,4": return "iPad Pro (10.5-inch)"
      case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro (11-inch) (1st generation)"
      case "iPad8,9", "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
      case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
      case "iPad6,7", "iPad6,8": return "iPad Pro (12.9-inch) (1st generation)"
      case "iPad7,1", "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
      case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
      case "iPad8,11", "iPad8,12": return "iPad Pro (12.9-inch) (4th generation)"
      case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11": return "iPad Pro (12.9-inch) (5th generation)"
      case "AppleTV5,3": return "Apple TV"
      case "AppleTV6,2": return "Apple TV 4K"
      case "AudioAccessory1,1": return "HomePod"
      case "AudioAccessory5,1": return "HomePod mini"
      case "i386", "x86_64", "arm64": return "\(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS")) (sim)"
      default: return identifier
      }
#elseif os(tvOS)
      switch identifier {
      case "AppleTV5,3": return "Apple TV 4"
      case "AppleTV6,2": return "Apple TV 4K"
      case "i386", "x86_64", "arm64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
      default: return identifier
      }
#endif
    }

    return mapToDevice(identifier: identifier)
  }()
}

// Software Getters

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

func kernelVersion() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.release)
  return machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8, value != 0 else { return identifier }
    return identifier + String(UnicodeScalar(UInt8(value)))
  }
}

var OSVer: String {
  return UIDevice.current.systemVersion
}

var hostName: String {
  return ProcessInfo.processInfo.hostName
}

var uptimeParsed: String {
  return parseSeconds(seconds: Int(ProcessInfo.processInfo.systemUptime))
}

// Battery Info

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
    return "Unknown"
  }
}

func isDebugged() -> Bool {
  return getppid() != 1
}
