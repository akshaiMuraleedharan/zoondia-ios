//
//  ApiServiceManager.swift
//  Friend Maker
//
//  Created by Subhosting's MacBook Pro on 09/10/24.
//

import Foundation

class ApiServiceManager {
    static let shared = ApiServiceManager()
    
    func fetchFriends(completion: @escaping ([Person]?, Error?) -> Void) {
        
        guard let url = URL(string: "https://64ff120df8b9eeca9e298830.mockapi.io/api/v1/friends") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion([], error)
                return
            }
            
            guard let data else { return }
            
            do {
                let friends = try JSONDecoder().decode([Person].self, from: data)
                completion(friends, error)
            } catch let jsonError {
                completion([], jsonError)
            }
        }
        task.resume()
    }
}
