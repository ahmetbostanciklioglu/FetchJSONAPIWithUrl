//
//  Post.swift
//  LoadDataFromJsonAPI
//
//  Created by Ahmet Bostancıklıoğlu on 25.12.2022.
//

import Foundation

struct PostModel: Codable {
    var userId: Int!
    var id: Int!
    var title: String!
    var body: String!
}
