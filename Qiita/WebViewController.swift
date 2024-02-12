//
//  WebViewController.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/10.
//

import UIKit
// WebKitをimport
import WebKit

class WebViewController: UIViewController {
    private let webView = WKWebView()

    // ①表示するURLを持っておく
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.frame
        view.addSubview(webView)

        // ②googleのページからプロパティのurlに変更
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
