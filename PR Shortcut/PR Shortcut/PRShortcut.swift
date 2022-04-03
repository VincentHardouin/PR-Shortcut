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
        menu = Menu()
        start()
    }
    
    func start() {
        guard let button = statusItem.button else { return }
        button.image = NSImage(named: NSImage.Name("StatusBarMenuImage"))
        statusItem.menu = menu
    }
}
