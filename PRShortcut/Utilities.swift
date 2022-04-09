//
//  Utilities.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 03/04/2022.
//

import Foundation

@discardableResult
func shell(_ args: [String]) -> Int32 {
  let task = Process()
  task.launchPath = "/usr/bin/env"
  task.arguments = args
  task.launch()
  task.waitUntilExit()
  return task.terminationStatus
}
