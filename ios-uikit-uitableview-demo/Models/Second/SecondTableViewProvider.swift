//
//  SecondTableViewProvider.swift
//  ios-uikit-uitableview-demo
//
//  Created by OkuderaYuki on 2017/04/29.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SecondTableViewProvider: NSObject {
    var items: [SecondTableViewCellItem] = []
    
    func set(items: [SecondTableViewCellItem]) {
        self.items = items
    }
    
    func append(item: SecondTableViewCellItem) {
        items.append(item)
    }
}

extension SecondTableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        cell.cellItem = items[indexPath.row]
        
        // cellが選択された時のスタイルをnoneに設定
        cell.selectionStyle = .none
        
        return cell
    }
}
