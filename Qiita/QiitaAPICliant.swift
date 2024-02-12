//
//  QiitaAPICliant.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/12.
//

import Foundation
import Alamofire
// APIからデータを取得するためのプロトコル
protocol APIService {
    func fetchArticles(completion: @escaping ([QiitaArticle]?, Error?) -> Void)
}

// プロトコルを実装するクラス
class APIServiceImpl: APIService {
    func fetchArticles(completion: @escaping ([QiitaArticle]?, Error?) -> Void) {
        AF.request("https://qiita.com/api/v2/tags/iOS/items").response { response in
            guard let data = response.data else {
                completion(nil, nil)
                return
            }
            let decoder = JSONDecoder()
            do {
                let articles: [QiitaArticle] = try decoder.decode([QiitaArticle].self, from: data)
                completion(articles, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
