//
//  PRShortcut.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Foundation
import SwiftUI

class PRShortcut: NSObject {
  @objc public let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
  private var menu: Menu!

  override init() {
    super.init()
    self.menu = Menu()
    self.populateFooter()
    self.start()
  }

  func start() {
    guard let button = statusItem.button else { return }
    button.image = NSImage(named: NSImage.Name("StatusBarMenuImage"))
    self.statusItem.menu = self.menu
  }

  func populateFooter() {
    self.menu.addItem(NSMenuItem.separator())
    let preferenceItem = NSMenuItem(title: "Preferences...", action: #selector(self.openPreferences(_:)), keyEquivalent: ",")
    preferenceItem.target = self
    self.menu.addItem(preferenceItem)
    self.menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
  }
}
