//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addData()
        addLayout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // type = 1,2
    var itemData: <#type#>? {
        didSet {
            addData()
//            addLayout()
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
