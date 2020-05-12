//
//  NewTagCell.swift
//  TagLayout
//
//  Created by Tim Duckett on 12.05.20.
//  Copyright © 2020 Tim Duckett. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        contentView.backgroundColor = UIColor.cyan
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                          withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                          verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        guard let leftConstraintConstant = titleLabel.findConstraint(layoutAttribute: .left)?.constant,
            let rightConstraintConstant = titleLabel.findConstraint(layoutAttribute: .left)?.constant else {
                return CGSize(width: titleLabel.intrinsicContentSize.width, height: titleLabel.intrinsicContentSize.height)
        }
        
        let width = titleLabel.intrinsicContentSize.width + leftConstraintConstant + rightConstraintConstant
        
        return CGSize(width: width, height: 50)
    }

}

