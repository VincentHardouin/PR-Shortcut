//
//  AppDelegate.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var prShortcut: PRShortcut!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        prShortcut = PRShortcut()
    }
}
