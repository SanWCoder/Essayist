//
//  AppBaseViewController.swift
//  Templates
//
//  Created by SanW on 2023/6/8.
//  Copyright © 2023 SanW. All rights reserved.
//
//  summary:<#summary#>
//

import UIKit

class AppBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        addData()
        addLayout()
        requestData()
        addObserver()
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

    // MARK: - net request

    /// net request
    fileprivate func requestData() {}

    // MARK: - addObserver

    /// addObserver
    fileprivate func addObserver() {}

    // MARK: - removeObserver

    /// removeObserver
    fileprivate func removeObserver() {}
}

// MARK: - delegate

/// delegate
// extension AppBaseViewController: <#delegate#> {
//
// }

// MARK: - life cycle

/// life cycle
// extension AppBaseViewController {
//  open override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//  }
//
//  open override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//
//  }
//
//  open override func viewWillDisappear(_ animated: Bool) {
//    super.viewWillDisappear(animated)
//
//  }
//
//  open override func viewDidDisappear(_ animated: Bool) {
//    super.viewDidDisappear(animated)
//
//  }
//
//
//  deinit {
//    removeObserver()
//  }
//
//  open override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//
//  }
// }
