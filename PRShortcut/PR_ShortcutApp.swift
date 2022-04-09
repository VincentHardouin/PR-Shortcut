//
//  PR_ShortcutApp.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import SwiftUI

@main
struct PRShortcutApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

  var body: some Scene {
    WindowGroup {
      EmptyView().frame(width: 0, height: 0)
    }
  }
}
