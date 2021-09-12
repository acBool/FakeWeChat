//
//  FWCMessageModel.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import Foundation
import HandyJSON


/// 消息类型，目前只考虑文本和图片
enum FWCMessageContentType {
    case Text
    case Image
}


/// 消息
class FWCMessageModel: HandyJSON {
    // 消息id
    var messageId: Int64 = 0
    // 发送信息人id
    var fromUid: Int64 = 0
    // 接收信息人id
    var receiverUid: Int64 = 0
    // 发信人昵称
    var fromUserName: String = ""
    // 收信人昵称
    var receiverUserName: String = ""
    // 发信人头像
    var fromUserAvatarUrl: String = ""
    // 收信人头像
    var receiverUserAvatarUrl: String = ""
    // 消息类型
    var messageContentType : FWCMessageContentType = .Text
    // 消息文本
    var messageText: String = ""
    // 消息时间
    var messageTime: Int64 = 0
    // 会话id，每组会话对应一个唯一id。多条消息的chatSessionId可能相同。
    var chatSessionId: Int64 = 0
    
    required init() {}
}

extension FWCMessageModel {
    static func createModel(dict: [String: Any]) -> FWCMessageModel {
        let model = FWCMessageModel()
        model.messageText = dict["messageText"] as! String
        model.messageTime = dict["messageTime"] as! Int64
        model.fromUid = dict["fromUid"] as! Int64
        model.receiverUid = dict["receiverUid"] as! Int64
        model.fromUserName = dict["fromUserName"] as! String
        model.receiverUserName = dict["receiverUserName"] as! String
        model.fromUserAvatarUrl = dict["fromUserAvatarUrl"] as! String
        model.receiverUserAvatarUrl = dict["receiverUserAvatarUrl"] as! String
        model.chatSessionId = dict["chatSessionId"] as! Int64
        let type: Int = dict["messageContentType"] as! Int
        if type == 1 {
            model.messageContentType = .Text
        }else{
            model.messageContentType = .Image
        }
        return model
    }
}
