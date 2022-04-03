//
//  PullRequestMenuItem.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 03/04/2022.
//

import Foundation
import AppKit

class PullRequestMenuItem: NSMenuItem {
    
    public var item: PullRequest!
    
    required init(coder: NSCoder) {
       super.init(coder: coder)
    }
    
    init(item: PullRequest) {
        super.init(title: item.title, action: #selector(onSelect(_:)), keyEquivalent: "")
        self.item = item
        self.target = self
    }
    
    @objc
    func onSelect(_ sender: NSMenuItem) {
        let command = ["open", self.item.htmlUrl.absoluteString]
        shell(command)
    }
}
