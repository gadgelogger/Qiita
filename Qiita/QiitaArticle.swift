//
//  QiitaArticle.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/10.
//

import Foundation

struct QiitaArticle: Codable {
    let title: String
    let url: String
    let user: QiitaUser // ⓵
}
