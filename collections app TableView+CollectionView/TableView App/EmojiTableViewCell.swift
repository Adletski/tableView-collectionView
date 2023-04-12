//
//  EmojiTableViewCell.swift
//  collections app TableView+CollectionView
//
//  Created by Adlet Zhantassov on 12.04.2023.
//

import UIKit
import SnapKit

class EmojiTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "😈"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var textOne: UILabel = {
        let label = UILabel()
        label.text = "Adlet"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var textTwo: UILabel = {
        let label = UILabel()
        label.text = "iOS man"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    //MARK: - Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        vStack.addArrangedSubview(textOne)
        vStack.addArrangedSubview(textTwo)
        hStack.addArrangedSubview(emojiLabel)
        hStack.addArrangedSubview(vStack)
        addSubview(hStack)
        
        hStack.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ object: Emoji) {
        self.emojiLabel.text = object.emoji
        self.textOne.text = object.name
        self.textTwo.text = object.description
    }
    
}
