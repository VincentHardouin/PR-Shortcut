//
//  PullRequest.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Foundation

struct PullRequest: Codable {
    enum CodingKeys: String, CodingKey {
        case htmlUrl = "html_url"
        case repositoryUrl = "repository_url"
        case id
        case title
    }
    
    let id: Int
    let title: String
    let htmlUrl: URL
    let repositoryUrl: URL
}
