//
//  AppTabViewController.swift
//  Templates
//
//  Created by SanW on 2023/5/12.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

class AppTabViewController: UITabBarController, UITabBarControllerDelegate {
    // 当前的风格
    var barColorStyle: AppTabBar.BarColorStyle?
    var separateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setValue(AppTabBar(), forKey: "tabBar")
        // 去掉默认的半透明色
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.white
        tabBar.backgroundColor = UIColor.black
        tabBar.barTintColor = UIColor.black
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .semibold)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .semibold)], for: .selected)
        addChildItem(childVc: AppBaseViewController(), title: "tab_home", image: UIImage(named: "icon_detail_back"), seleImage: UIImage(named: "icon_detail_back"))
        addChildItem(childVc: AppBaseViewController(), title: "tab_me", image: UIImage(named: "icon_detail_back"), seleImage: UIImage(named: "icon_detail_back"))
        separateView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5))
        separateView.backgroundColor = .black
        tabBar.addSubview(separateView)
        separateView.isHidden = true
        delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(enterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func enterBackground() {
        print("进入到后台")
    }

    @objc func willEnterForeground() {
        print("进入到后台")
    }

    /// 添加item
    private func addChildItem(childVc: UIViewController, title: String?, image: UIImage? = nil, seleImage: UIImage? = nil) {
        let item = UITabBarItem(title: title, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: seleImage?.withRenderingMode(.alwaysOriginal))
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for: .selected)
        childVc.tabBarItem = item
        childVc.title = title
        let nav = UINavigationController(rootViewController: childVc)
//        if title != nil {
//            nav.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -12)
//        }
//      if image != nil, title == nil {
//          nav.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//      }
        addChild(nav)
    }

    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return selectedViewController!.supportedInterfaceOrientations
    }

    func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return selectedViewController!.preferredInterfaceOrientationForPresentation
    }

    func tabBarController(_: UITabBarController, shouldSelect _: UIViewController) -> Bool {
//      if viewController.tabBarItem.title == nil {
//          return false
//      }
        return true
    }

    //  func tabBarController(_ tabBarController: UITabBarController, didSelect _: UIViewController) {
//
    //  }

    override var childForStatusBarStyle: UIViewController? {
        return selectedViewController
    }

    override var childForStatusBarHidden: UIViewController? {
        return selectedViewController
    }

    /// MAKR:  -- 变色
    func tabbarStyle(_ type: AppTabBar.BarColorStyle) {
        if barColorStyle == type {
            return
        }
        barColorStyle = type
        separateView.isHidden = !(type == .light)
        switch type {
        case .light:
            tabBar.backgroundColor = .white
            tabBar.barTintColor = .white
            tabBar.tintColor = .black
        default:
            tabBar.backgroundColor = .black
            tabBar.barTintColor = .black
            tabBar.tintColor = .white
        }
        let whiteArray = ["tab_home_selected_w", "tab_attent_selected_w", "tab_public", "tab_message_selected_w", "tab_mine_selected_w"]
        let blackArray = ["tab_home_selected", "tab_attent_selected", "tab_public", "tab_message_selected", "tab_mine_selected"]
        for (index, item) in tabBar.items!.enumerated() {
            item.selectedImage = UIImage(named: (type == .light) ? blackArray[index] : whiteArray[index])?.withRenderingMode(.alwaysOriginal)
            item.setTitleTextAttributes([.foregroundColor: (type == .light) ? UIColor.black : UIColor.white], for: .selected)
        }
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()
    }
}
