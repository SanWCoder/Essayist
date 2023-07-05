//
//  AppCommonUtil.swift
//  Templates
//
//  Created by SanW on 2023/6/8.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

// 版本构建号
public let versionCode = "\(Bundle.main.infoDictionary?["CFBundleVersion"] ?? "1")"
// 版本号
public let versionName = "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "1.0.0")"
