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

    /// init reusableSupplementaryView
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - indexPath: <#indexPath description#>
    ///   - kind: <#kind description#>
    /// - Returns: <#description#>
    @objc class func dequeueReusableSupplementaryView(collectionView: UICollectionView, indexPath: IndexPath, kind: String) -> ___FILEBASENAMEASIDENTIFIER___ {
        let reusableSupplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(self), for: indexPath) as? ___FILEBASENAMEASIDENTIFIER___ ?? ___FILEBASENAMEASIDENTIFIER___()
        return reusableSupplementaryView
    }

    /// register
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - kind: <#kind description#>
    /// - Returns: <#description#>
    @objc class func registerSupplementaryView(collectionView: UICollectionView, kind: String) {
        collectionView.register(self, forSupplementaryViewOfKind: kind, withReuseIdentifier: NSStringFromClass(self))
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
