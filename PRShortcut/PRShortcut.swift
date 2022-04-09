//
//  PRShortcut.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Foundation
import Preferences
import SwiftUI

class PRShortcut: NSObject {
  @objc public let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
  private var menu: Menu!

  private lazy var preferencesWindowController = PreferencesWindowController(
    preferencePanes: [
      GeneralPreferenceViewController(),
    ]
  )

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
    let preferencesItem = NSMenuItem(title: "Preferences...", action: #selector(self.openPreferences(_:)), keyEquivalent: ",")
    preferencesItem.target = self
    self.menu.addItem(preferencesItem)
    self.menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
  }

  @objc
  func openPreferences(_: NSMenuItem) {
    self.preferencesWindowController.show()
  }
}
