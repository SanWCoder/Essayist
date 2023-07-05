//
//  AppDelegate.swift
//  Templates
//
//  Created by SanW on 2023/6/8.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var lastBgDate: Int64 = 0 // 进入后台时间
    var isEnterBack: Bool = false
    var isAllowRotation: Bool = false // 是否支持屏幕旋转
    var notificationUserInfo: [String: Any]?

    func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.black
        window?.rootViewController = AppConfigUtil.configRootViewController()
        window?.makeKeyAndVisible()
        // 启动配置
        AppConfigUtil.applicationConfig(launchOptions: launchOptions)
        return true
    }

    // 後台
    func applicationDidEnterBackground(_: UIApplication) {
        NSLog("applicationDidEnterBackground")
        lastBgDate = Int64(Date().timeIntervalSince1970)
        // 热启动重新生成SubSesstionId
        isEnterBack = true
        AppMemoryManager.shared.createSubSesstionId()
//      DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 1) {
//          // 继续播放其他音乐
//          do {
//              try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
//              NSLog("关闭声音活跃继续播放其他音乐成功")
//          } catch {
//              NSLog("关闭声音活跃继续播放其他音乐失败：\(error)")
//          }
//      }
    }

    func applicationWillEnterForeground(_: UIApplication) {
        NSLog("applicationWillEnterForeground")
        let currDate = Int64(Date().timeIntervalSince1970)
        if (currDate - lastBgDate) > 10 * 60 {}
    }

    func applicationDidBecomeActive(_: UIApplication) {
        NSLog("applicationDidBecomeActive")
//      DispatchQueue.global().async {
//          let session = AVAudioSession.sharedInstance()
//          do {
//              try session.setCategory(.playback)
//              NSLog("打开声音活跃关闭其他音乐播放成功")
//          } catch {
//              NSLog("打开声音活跃关闭其他音乐播放失败：\(error)")
//          }
//          do {
//              try session.setActive(true, options: .notifyOthersOnDeactivation)
//              NSLog("打开声音活跃关闭其他音乐播放成功")
//          } catch {
//              NSLog("打开声音活跃关闭其他音乐播放失败：\(error)")
//          }
//      }
        if isEnterBack {
            isEnterBack = false
        }
    }
}
