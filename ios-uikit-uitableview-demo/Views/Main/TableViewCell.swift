//
//  TableViewCell.swift
//  ios-uikit-uitableview-demo
//
//  Created by Kentaro on 2017/03/05.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var fruitsLabel: UILabel!
    @IBOutlet private weak var sectionLabel: UILabel!
    @IBOutlet private weak var rowLabel: UILabel!
    
    func setup(with fruit: String, indexPath: IndexPath)  {
        fruitsLabel.text = fruit
        sectionLabel.text = "section: \(indexPath.section)"
        rowLabel.text = "row:\(indexPath.row)"
    }
    
    // 選択時に呼ばれる
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("selected = \(selected), animated = \(animated)")
    }
}
