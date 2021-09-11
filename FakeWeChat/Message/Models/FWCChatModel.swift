//
//  FWCChatModel.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import Foundation
import HandyJSON

class FWCChatModel: HandyJSON {
    // 发送信息人id
    var fromUid: Int64 = 0
    // 接收信息人id
    var receiverUid: Int64 = 0
    // 发信人昵称
    var nickName: String = ""
    // 发信人头像
    var avatarUrl: String = ""
    // 最后一条信息文本
    var messageText: String = ""
    // 最后一条信息类型
    var messageContentType : FWCMessageContentType = .Text
    // 会话id，每组会话对应一个唯一id
    var chatSessionId: Int64 = 0
    
    required init() {}
}
