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


/// 最新的一条消息
class FWCMessageModel: HandyJSON {
    var nickName : String?
    var messageContentType : FWCMessageContentType = .Text
    var chatId : String?  //每个人，群，公众帐号都有一个 uid，统一叫 chatId
    // 最新消息
    var latestMessage : String?
    // 时间
    var dateTime: String?
    
    required init() {}
}
