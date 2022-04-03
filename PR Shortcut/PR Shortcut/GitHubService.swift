//
//  GitHubService.swift
//  PR Shortcut
//
//  Created by Vincent Hardouin on 02/04/2022.
//

import Foundation

enum GitHubServiceError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct GithubService {
    
    let githubApiURL = "https://api.github.com"
    
    func getPullRequest(completion: @escaping(Result<[PullRequest], GitHubServiceError>) -> Void) {
        let url = getUrlForSearch(author: "VincentHardouin")
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, _, _)  in
            guard let jsonData = data
            else {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                let githubSearchResponse = try JSONDecoder().decode(GitHubSearchResponse.self, from: jsonData)
                let pullRequests = githubSearchResponse.items
                completion(.success(pullRequests))
                return
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
    private func getUrlForSearch(author: String) -> URL? {
        guard var gitHubApiURL = URLComponents(string: "\(self.githubApiURL)/search/issues") else { return nil }
        gitHubApiURL.queryItems = [URLQueryItem(name: "q", value: "is:open author:\(author) archived:false")]
        return gitHubApiURL.url
    }
}
