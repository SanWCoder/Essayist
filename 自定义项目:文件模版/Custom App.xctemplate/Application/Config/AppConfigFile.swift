//
//  AppConfigFile.swift
//  Templates
//
//  Created by SanW on 2023/5/12.
//  Copyright © 2023 SanW. All rights reserved.
//

import Foundation
import UIKit

class AppConfigUtil: NSObject {
    class func applicationConfig(launchOptions _: [UIApplication.LaunchOptionsKey: Any]?) {}

    class func configRootViewController() -> UIViewController {
        return AppTabViewController()
    }
}
