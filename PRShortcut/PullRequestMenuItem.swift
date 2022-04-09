//
//  PullRequestMenuItem.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 03/04/2022.
//

import AppKit
import Foundation

class PullRequestMenuItem: NSMenuItem {
  public var item: PullRequest!

  required init(coder: NSCoder) {
    super.init(coder: coder)
  }

  init(item: PullRequest) {
    super.init(title: item.title, action: #selector(self.onSelect(_:)), keyEquivalent: "")
    self.item = item
    self.target = self
  }

  static func == (lhs: PullRequestMenuItem, rhs: PullRequestMenuItem) -> Bool {
    lhs.item == rhs.item
  }

  override func isEqual(_ object: Any?) -> Bool {
    self.item == (object as? PullRequestMenuItem)?.item
  }

  @objc
  func onSelect(_: NSMenuItem) {
    let command = ["open", self.item.htmlUrl.absoluteString]
    shell(command)
  }
}
