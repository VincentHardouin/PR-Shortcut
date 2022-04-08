//
//  AppDelegate.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Cocoa
import Preferences

extension Preferences.PaneIdentifier {
  static let general = Self("general")
  static let accounts = Self("accounts")
}

class AppDelegate: NSObject, NSApplicationDelegate {
  private var prShortcut: PRShortcut!

  func applicationDidFinishLaunching(_: Notification) {
    self.prShortcut = PRShortcut()
  }
}
