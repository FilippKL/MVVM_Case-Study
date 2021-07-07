//
//  Parser.swift
//  MVVM_Case-Study
//
//  Created by Filipp Krupnov on 6/7/21.
//

import Foundation

var sumStar : Int = 0
var sumIssues: Int = 0


struct Parser {
    
    func requestData() {
        
        let urlComponents = URLComponents(string: "https://api.github.com/users/\(userN)/repos")
        let wordsRequest = URLRequest(url: urlComponents!.url!)
    
        let sharedSession = URLSession.shared
        
        let wordTask = sharedSession.dataTask(with: wordsRequest) { [self] (data, response, error) in
            if let data = data,
               let response = response as? HTTPURLResponse,
               (200..<300) ~= response.statusCode,
               error == nil,
               let requestedWord = try? JSONDecoder().decode([Request].self, from: data){
//                print(requestedWord)
                
                sumStar = requestedWord.map({ $0.stargazers_count }).reduce(0, +)
                sumIssues = requestedWord.map({ $0.open_issues_count }).reduce(0, +)
                print(sumStar, sumIssues)
                DispatchQueue.main.async {
                        }
                    }
        }
        wordTask.resume()
    }
}

