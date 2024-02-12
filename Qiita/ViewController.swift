//
//  ViewController.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/10.
//

import UIKit
import Alamofire // ➀importの追加

class ViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    private var apiService: APIService!
    private var articles: [QiitaArticle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiService = APIServiceImpl()
        //1:tableViewのdatasourceをViewController自身に設定
        tableView.dataSource = self
        tableView.delegate = self // この行を追加

        //2:cellをtableViewに設定
        //nibNameはファイル名を指定する
        let nib = UINib(nibName: "QiitaTableViewCell", bundle: nil)
        //Identifierを登録
        tableView.register(nib, forCellReuseIdentifier: "QiitaTableViewCell")
        //Cellの高さを設定
        tableView.rowHeight = 80
        loadArticles()
    }
    private func loadArticles() {
        apiService.fetchArticles { [weak self] (articles, error) in
            if let error = error {
                print(error)
                return
            }
            if let articles = articles {
                self?.articles = articles
                self?.tableView.reloadData()
            }
        }
    }
  }
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ⑦cell数をarticlesの数に設定
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaTableViewCell", for: indexPath) as? QiitaTableViewCell else {
            return UITableViewCell()
        }
        // ⑧indexPathを用いてarticlesから該当のarticleを取得する
        let article = articles[indexPath.row]
        // ⑨cellへの反映
        cell.set(title: article.title, author: article.user.id,imageUrl: article.user.imageUrl)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
        let webViewController = storyboard.instantiateInitialViewController() as! WebViewController
        // ③indexPathを使用してarticlesから選択されたarticleを取得
        let article = articles[indexPath.row]
        // ④urlとtitleを代入
        webViewController.url = article.url
        webViewController.title = article.title
        navigationController?.pushViewController(webViewController, animated: true)
    }
}
