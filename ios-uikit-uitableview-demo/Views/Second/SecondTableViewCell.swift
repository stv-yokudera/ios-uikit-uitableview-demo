//
//  SecondTableViewCell.swift
//  ios-uikit-uitableview-demo
//
//  Created by OkuderaYuki on 2017/04/29.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    /// Cellの表示項目のValue
    var cellItem: SecondTableViewCellItem? {
        
        // cellItemに値がセットされたら、処理を実行
        didSet {
            
            // cellItem?.imageがnilの場合は、noImageをcellImageViewにセットする
            cellImageView.image = cellItem?.image ?? #imageLiteral(resourceName: "noImage")
            
            // cellItem?.commentをセットし、もし空文字だったら、labelを非表示にする
            label.text = cellItem?.comment
            label.isHidden = (label.text?.characters.count == 0)
        }
    }
    
    /// Cellのidentifierを返却
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    /// CellのnibNameを返却(identifierと同じ値)
    static var nibName: String {
        get {
            return self.identifier
        }
    }
}
