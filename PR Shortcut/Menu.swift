//
//  Menu.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import SwiftUI

class Menu: NSMenu, NSMenuDelegate {
  class IndexedItem: NSObject {
    var item: PullRequestMenuItem!
    var menuItems: [PullRequestMenuItem]

    init(value _: String, item: PullRequestMenuItem?, menuItems: [PullRequestMenuItem]) {
      self.item = item
      self.menuItems = menuItems
    }
  }

  public let maxHotKey = 9

  private var githubService: GithubService!
  private var currentPullRequestMenuItems: [PullRequestMenuItem] = []

  required init(coder decoder: NSCoder) {
    super.init(coder: decoder)
  }

  init() {
    super.init(title: "PR Shortcut")
    self.githubService = GithubService()
    self.delegate = self

    self.populateFooter()
  }

  func populateFooter() {
    self.addItem(NSMenuItem.separator())
    self.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
  }

  func menuWillOpen(_: NSMenu) {
    self.refreshMenu()
  }

  func refreshMenu() {
    self.githubService.getPullRequest { [weak self] result in
      switch result {
      case let .failure(error):
        print(error)
      case let .success(pullRequests):
        self?.updateItems(pullRequests: pullRequests)
      }
    }
  }

  func updateItems(pullRequests: [PullRequest]) {
    var newItems: [PullRequestMenuItem] = []
    for pullRequest in pullRequests.reversed() {
      let item = PullRequestMenuItem(item: pullRequest)
      if self.items.contains(item) {
        if let currentItem = self.items.first(where: { $0 == item && $0.title != item.title }) {
          self.updateItem(currentItem: currentItem, newItem: item)
        }
      } else {
        self.insertItem(item, at: 0)
      }
      newItems.append(item)
    }

    self.removeUselessPullRequest(newItems: newItems)
    self.currentPullRequestMenuItems = newItems
  }

  func updateItem(currentItem: NSMenuItem, newItem: PullRequestMenuItem) {
    let index = index(of: currentItem)
    self.removeItem(at: index)
    self.insertItem(newItem, at: index)
  }

  func removeUselessPullRequest(newItems: [PullRequestMenuItem]) {
    let itemsToBeRemoved = self.findItemsToBeRemove(currentItems: self.currentPullRequestMenuItems, newItems: newItems)
    self.clear(itemsToBeRemoved)
  }

  func findItemsToBeRemove(
    currentItems: [PullRequestMenuItem],
    newItems: [PullRequestMenuItem]
  ) -> [PullRequestMenuItem] {
    currentItems.filter { currentItem in
      !newItems.contains(currentItem)
    }
  }

  func clearAll() {
    self.clear(self.currentPullRequestMenuItems)
  }

  private func clear(_ itemsToClear: [PullRequestMenuItem]) {
    itemsToClear.forEach { menuItem in
      if items.contains(menuItem) {
        removeItem(at: index(of: menuItem))
      }
    }
  }
}
