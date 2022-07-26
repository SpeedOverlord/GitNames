//
//  GitNameListModel.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

struct GitNameModel: Decodable {
    let loginName: String
    let avatarUrl: String?
    let isSiteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar_url = "avatar_url"
        case site_admin = "site_admin"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        loginName = try container.decode(String.self, forKey: .login)
        avatarUrl = try? container.decode(String.self, forKey: .avatar_url)
        isSiteAdmin = try container.decode(Bool.self, forKey: .site_admin)
    }
}
