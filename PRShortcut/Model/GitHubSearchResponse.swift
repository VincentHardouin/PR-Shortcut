//
//  GitHubSearchResponse.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Foundation

struct GitHubSearchResponse: Decodable {
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case incompleteResults = "incomplete_results"
    case items
  }

  let totalCount: Int
  let incompleteResults: Bool
  let items: [PullRequest]
}
