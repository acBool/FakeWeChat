//
//  FWCUser.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import Foundation

class FWCUser {
    // 临时方法
    static func isFromMe(_ model: FWCMessageModel) -> Bool {
        if model.fromUid == 100 {
            return true
        }
        return false
    }
}
