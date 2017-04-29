//
//  SecondViewController.swift
//  ios-uikit-uitableview-demo
//
//  Created by OkuderaYuki on 2017/04/29.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let dataSource = SecondTableViewProvider()
    fileprivate let refreshControl = UIRefreshControl()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - file private
private extension SecondViewController {
    
    func setup() {
        
        // Nibを登録
        registerNibs()
        
        // TableViewCellの高さを可変にする設定
        setupTableViewAutomaticDimension()
        
        // ダミーデータをセット
        dataSource.set(items: dummyCellItems())
        
        // tableViewDataSourceを設定
        tableView.dataSource = dataSource
        
        // RefreshControlを設定
        setupRefreshControl()
    }
    
    /// TableViewにNibを登録
    func registerNibs() {
        // MARK: SecondTableViewCell
        let nib = UINib(nibName: SecondTableViewCell.nibName, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: SecondTableViewCell.identifier)
    }
    
    /// TableViewCellの高さを可変にする設定
    func setupTableViewAutomaticDimension() {
        tableView.estimatedRowHeight = 88
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    /// TableViewにUIRefreshControlを設定
    func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        // 文言設定
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        // アクション設定
        refreshControl.addTarget(self,
                                 action: .refresh,
                                 for: .valueChanged)
    }
    
    /// pull to refresh時のアクション
    @objc func refresh(sender: UIRefreshControl) {
        
        // クルクル開始
        refreshControl.beginRefreshing()
        print("beginRefreshing()後のリフレッシュ状態 = \(sender.isRefreshing)")
        
        // データ更新処理などをする（ここでは遅延処理で擬似的に更新している感じを出している）
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            print("ここでやりたい処理をする")
            // tableも更新する
            self.tableView.reloadData()
            // クルクルを止める
            self.refreshControl.endRefreshing()
            print("beginRefreshing()後のリフレッシュ状態 = \(sender.isRefreshing)")
        }
    }
}

// MARK: - dummy data
private extension SecondViewController {
    func dummyCellItems() -> [SecondTableViewCellItem] {
        var items: [SecondTableViewCellItem] = []
        
        var item = SecondTableViewCellItem()
        
        item.comment = "[dummy]"
        item.image = #imageLiteral(resourceName: "tiger")
        items.append(item)
        
        item.comment = "[dummy]\n0123456789\nabcd\nefgh\nijkl\nmnop\nqrst\nuvwxyz"
        item.image = nil
        items.append(item)
        
        item.comment = "[dummy]"
        item.image = #imageLiteral(resourceName: "rabbit")
        items.append(item)
        
        item.comment = "[dummy]\n0123456789\nabcd\nefgh\nijkl\nmnop\nqrst\nuvwxyz"
        item.image = #imageLiteral(resourceName: "monkey")
        items.append(item)
        
        item.comment = ""
        item.image = #imageLiteral(resourceName: "hedgehog")
        items.append(item)
        
        return items
    }
}

// MARK: - SecondViewControllerの独自Selectorを作成
private extension Selector {
    static let refresh = #selector(SecondViewController.refresh(sender:))
}
