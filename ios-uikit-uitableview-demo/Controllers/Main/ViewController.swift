//
//  ViewController.swift
//  ios-uikit-uitableview-demo
//
//  Created by Kentaro on 2017/03/05.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    // 簡易的にこの配列をDataSourceとする
    fileprivate let fruits = ["苺", "りんご", "みかん", "ブドウ", "梨", "オレンジ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - setup
    
    private func setup() {
        /*
         iOS10以降UIScrollViewでrefreshControlがサポートされるので
         UITableViewControllerでなくてもOK
         */
        tableView.refreshControl = refreshControl
        // 文言設定
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        // アクション設定
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    // MARK: - action
    
    // pull to refresh時のアクション
    func refresh(sender: UIRefreshControl) {
        
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

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    // セクション数を返す（実装必須）
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    // セクションごとのセル数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    // セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section: \(section)"
    }
    
    // セルの内容を返す（実装必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setup(with: fruits[indexPath.row], indexPath: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // セルタップ時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルをタップしました indexPath = \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 画面遷移
        guard let secondVC = UIStoryboard(name: "SecondViewController", bundle: nil).instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // セル表示直前に呼ばれる
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("セル表示直前です")
    }
}
