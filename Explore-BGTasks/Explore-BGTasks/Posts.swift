//
//  Posts.swift
//  Explore-BGTasks
//
//  Created by Abhilash Palem on 07/12/22.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
