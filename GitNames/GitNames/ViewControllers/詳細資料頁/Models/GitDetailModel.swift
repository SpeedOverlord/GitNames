//
//  GitDetailModel.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import Foundation
struct GitDetailModel: Decodable {
    let loginName: String
    let avatarUrl: String?
    let isSiteAdmin: Bool
    let name: String?
    let bio: String?
    let blog: String?
    let location: String?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar_url = "avatar_url"
        case site_admin = "site_admin"
        case name = "name"
        case bio = "bio"
        case blog = "blog"
        case location = "location"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        loginName = try container.decode(String.self, forKey: .login)
        avatarUrl = try? container.decode(String.self, forKey: .avatar_url)
        isSiteAdmin = try container.decode(Bool.self, forKey: .site_admin)
        name = try? container.decode(String.self, forKey: .name)
        bio = try? container.decode(String.self, forKey: .bio)
        blog = try? container.decode(String.self, forKey: .blog)
        location = try? container.decode(String.self, forKey: .location)
    }
}
