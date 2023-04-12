//
//  NewEmojiTableViewCell.swift
//  collections app TableView+CollectionView
//
//  Created by Adlet Zhantassov on 12.04.2023.
//

import UIKit
import SnapKit

class NewEmojiTableViewCell: UITableViewCell {

    private lazy var tf: UITextField = {
        let tf = UITextField()
        tf.addTarget(self, action: #selector(tfEditing), for: .editingChanged)
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(tf)
        tf.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(20)
            $0.trailing.equalTo(contentView).offset(-20)
            $0.height.equalTo(40)
        }
    }
    
    @objc func tfEditing() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
