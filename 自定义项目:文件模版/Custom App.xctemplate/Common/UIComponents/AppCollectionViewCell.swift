//
//  AppCollectionViewCell.swift
//  Templates
//
//  Created by SanW on 2023/6/8.
//  Copyright © 2023 SanW. All rights reserved.
//
//  summary:<#summary#>
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// init cell
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    @objc class func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> AppCollectionViewCell {
        let cell: AppCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(self), for: indexPath) as! AppCollectionViewCell
        return cell
    }

    var itemData: AppCollectionViewCell? {
        didSet {
            addData()
            addLayout()
        }
    }

    // MARK: - add views

    /// add views
    fileprivate func addSubviews() {}

    // MARK: - views data

    /// views data
    fileprivate func addData() {}

    // MARK: - views layout

    /// views layout
    fileprivate func addLayout() {}
}
