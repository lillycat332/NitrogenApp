//
//  SpecGetter.swift
//  SpecGetter
//
//  Created by Lilly Cham on 15/10/2021.
//

import Foundation

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
