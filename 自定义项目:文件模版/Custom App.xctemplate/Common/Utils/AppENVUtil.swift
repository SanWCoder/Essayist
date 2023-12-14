//
//  AppENVUtil.swift
//  Templates
//
//  Created by SanW on 2023/5/26.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

public enum ACENVMode: String {
    case ENVModeOnline // 线上环境
    case ENVModePre // 预发布环境
    case ENVModeTest // 测试环境
}

open class ACENVUtil {
    public static let shared = ACENVUtil()
    public var envMode: ACENVMode {
        let config = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ACENVConfig.plist", ofType: nil) ?? "")
        let enStr: String = (config?.object(forKey: "ENVMode") ?? "ENVModeOnline") as? String ?? ""
        return ACENVMode(rawValue: enStr) ?? .ENVModeOnline
    }

    // 打包的渠道  Appstore：苹果上传包渠道，Development:公司内部打包渠道会显示一些调试窗口信息
    public var channel: String {
        let config = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ACENVConfig.plist", ofType: nil) ?? "")
        let channel: String = (config?.object(forKey: "ENChannel") ?? "Appstore") as? String ?? ""
        return channel
    }

    // 打包时间
    public var buildTime: String {
        let config = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ACENVConfig.plist", ofType: nil) ?? "")
        let buildTime: String = (config?.object(forKey: "ENBuildTime") ?? "1990-01-01 00:00:00") as? String ?? ""
        return buildTime
    }

    // 通用域名-eg：数据上报
    public var commonapi: String {
        switch envMode {
        case .ENVModeOnline:
            break
        case .ENVModeTest:
            break
        case .ENVModePre:
            break
        default:
            break
        }
    }
}
