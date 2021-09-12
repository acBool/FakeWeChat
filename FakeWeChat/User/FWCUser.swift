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
    
    static func getUid() -> Int64 {
        return 100
    }
    
    static func getUserName() -> String {
        return "赵先生"
    }
    
    static func getUserAvatar() -> String {
        return "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true"
    }
}
