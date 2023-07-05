//
//  AppMemoryManager.swift
//  Templates
//
//  Created by SanW on 2023/5/26.
//  Copyright © 2023 SanW. All rights reserved.
//

import UIKit

class AppMemoryManager: NSObject {
    public static let shared = AppMemoryManager()

    public var sessionId: String = "\(Int64(Date().timeIntervalSince1970 * 1000))"
    public var subSessionId: String?
    public var mid: String = ""
    public var appId: String = ""

    public func commonParams() -> [String: Any] {
        let model = UIDevice.current.model
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion
        let localizedModel = UIDevice.current.localizedModel
        let machineInfo: [String: Any] = [
            "model": model, "system": systemName + " " + systemVersion, "brand": localizedModel, "platform": "iOS", "networkType": "",
        ]
        let commParams: [String: Any] = [
            "versionCode": versionCode,
            "system": systemName + " " + systemVersion,
            "systemVersion": systemName + " " + systemVersion,
            "appId": appId,
            "mid": mid,
            "networkType": "",
            "clientTimestamp": Int64(Date().timeIntervalSince1970 * 1000),
            "platform": "iOS",
            "versionName": versionName,
            "machineInfo": dictionaryToJsonString(machineInfo) ?? "",
            "requestId": "\(arc4random_uniform(1_000_000_000))",
            "sessionId": sessionId,
            "subSessionId": subSessionId ?? sessionId,
        ]
        return commParams
    }

    /// 创建sessionId
    /// - Returns: <#description#>
    public func createSesstionId() {
//      sessionId = getUniqueId(desc: "sessionId")
        sessionId = "\(Int64(Date().timeIntervalSince1970 * 1000))"
        subSessionId = sessionId
    }

    /// 创建subSessionid
    /// - Returns: <#description#>
    public func createSubSesstionId() {
//      subSessionId = getUniqueId(desc: "subSessionid")
        subSessionId = "\(Int64(Date().timeIntervalSince1970 * 1000))"
    }

    override private init() {
        super.init()
    }

    override public func copy() -> Any {
        return self
    }

    override public func mutableCopy() -> Any {
        return self
    }

    public func dictionaryToJsonString(_ dic: [String: Any]) -> String? {
        if !JSONSerialization.isValidJSONObject(dic) {
            return ""
        }
        guard let data = try? JSONSerialization.data(withJSONObject: dic, options: []) else {
            return ""
        }
        let str = String(data: data, encoding: String.Encoding.utf8)
        return str
    }
}
