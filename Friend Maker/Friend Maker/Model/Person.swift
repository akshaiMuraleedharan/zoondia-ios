//
//  PersonModel.swift
//  Friend Maker
//
//  Created by Subhosting's MacBook Pro on 09/10/24.
//

import Foundation

struct Person: Codable {
    let createdAt, name: String
    let avatar: String?
    let place, designation: String
    let isLiked: Bool
    let id: String
}
