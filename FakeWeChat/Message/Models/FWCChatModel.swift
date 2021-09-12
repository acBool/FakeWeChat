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
    // 好友昵称
    var nickName: String = ""
    // 发信人头像
    var avatarUrl: String = ""
    // 最后一条信息文本
    var messageText: String = ""
    // 最后一条信息类型
    var messageContentType : FWCMessageContentType = .Text
    // 会话id，每组会话对应一个唯一id
    var chatSessionId: Int64 = 0
    // 最后一条消息时间
    var lastMessageTime: Int64 = 0
    // 好友id
    var userId: Int64 = 0
    
    required init() {}
    
}

extension FWCChatModel {
    static func createModel(dict: [String: Any]) -> FWCChatModel {
        let model = FWCChatModel()
        model.messageText = dict["messageText"] as! String
        model.lastMessageTime = dict["lastMessageTime"] as! Int64
        model.fromUid = dict["fromUid"] as! Int64
        model.chatSessionId = dict["chatSessionId"] as! Int64
        model.nickName = dict["nickName"] as! String
        let type: Int = dict["messageContentType"] as! Int
        if type == 1 {
            model.messageContentType = .Text
        }else{
            model.messageContentType = .Image
        }
        model.receiverUid = dict["receiverUid"] as! Int64
        model.avatarUrl = dict["avatarUrl"] as! String
        model.userId = dict["userId"] as! Int64
        return model
    }
}
