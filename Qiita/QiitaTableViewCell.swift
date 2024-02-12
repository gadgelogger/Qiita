//
//  QiitaTableViewCell.swift
//  Qiita
//
//  Created by gadgelogger on 2024/02/10.
//

import UIKit
import Nuke
import NukeExtensions //コレ追加
class QiitaTableViewCell: UITableViewCell {
    //StoryBordと繋ぎ合わせる
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    //タイトルや作成者を設置する関数を設置する
    func set(title: String, author: String,imageUrl: String) {
        // ③Nukeを使用して画像を取得
        loadImage(with: URL(string: imageUrl)!, into: iconImageView)
        titleLabel.text = title
        authorLabel.text = author
       }
}
