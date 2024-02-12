//
//  QiitaUser.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/10.
//

import Foundation

struct QiitaUser: Codable {
    let id: String
    let imageUrl: String // ①

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "profile_image_url" // ②
    }
}
