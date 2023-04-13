//
//  CollectionViewCell.swift
//  collections app TableView+CollectionView
//
//  Created by Adlet Zhantassov on 13.04.2023.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.addSubview(photoView)
        photoView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
