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

        init(value: String, item: PullRequestMenuItem?, menuItems: [PullRequestMenuItem]) {
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
        
        populateFooter()
    }
    
    func populateFooter() {
        self.addItem(NSMenuItem.separator())
        self.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
    }
    
    func menuWillOpen(_ menu: NSMenu) {
        githubService.getPullRequest() { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pullRequests):
                self?.clearAll()
                
                var newPullRequestMenuItems: [PullRequestMenuItem] = []
                
                for pullRequest in pullRequests.reversed() {
                    let item = PullRequestMenuItem(item: pullRequest)
                    self?.insertItem(item, at: 0)
                    newPullRequestMenuItems.append(item)
                }
                
                self?.currentPullRequestMenuItems = newPullRequestMenuItems
            }
        }
    }
    
    func clearAll() {
        clear(currentPullRequestMenuItems)
    }
    
    private func clear(_ itemsToClear: [PullRequestMenuItem]) {
        itemsToClear.forEach({ menuItem in
          if items.contains(menuItem) {
            removeItem(menuItem)
          }
        })
    }
}
