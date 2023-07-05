//
//  AppTabBar.swift
//  Templates
//
//  Created by SanW on 2023/5/12.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

class AppTabBar: UITabBar {
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if isHidden { // 如果隐藏的话不处理事件
            return super.hitTest(point, with: event)
        }
        let view = super.hitTest(point, with: event)
        if view == nil {
            for subView in subviews {
                let myPoint = subView.convert(point, from: self)
                if subView.bounds.contains(myPoint) {
                    return subView
                }
            }
        }
        return view
    }

    public enum BarColorStyle {
        case light, dark
    }
}
