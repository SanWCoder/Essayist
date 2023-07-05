// ___FILEHEADER___
//  summary:<#summary#>
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {
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
    @objc class func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> ___FILEBASENAMEASIDENTIFIER___ {
        let cell: ___FILEBASENAMEASIDENTIFIER___ = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(self), for: indexPath) as! ___FILEBASENAMEASIDENTIFIER___
        return cell
    }

    /// register
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    /// - Returns: <#description#>
    @objc class func registerReusableCell(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: NSStringFromClass(self))
    }

    var itemData: <#type#>? {
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
