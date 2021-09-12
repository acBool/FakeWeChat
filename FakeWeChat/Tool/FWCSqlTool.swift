//
//  FWCSqlTool.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import Foundation
import UIKit
import SQLite

class FWCSqlTool {
    static let shared = FWCSqlTool()
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    var db: Connection
    
    // Message Table
    let mMessageId = Expression<Int64>("messageId")
    let mFromUid = Expression<Int64>("fromUid")
    let mReceiverUid = Expression<Int64>("receiverUid")
    let mFromUserName = Expression<String?>("fromUserName")
    let mReceiverUserName = Expression<String?>("receiverUserName")
    let mFromUserAvatarUrl = Expression<String?>("fromUserAvatarUrl")
    let mReceiverUserAvatarUrl = Expression<String?>("receiverUserAvatarUrl")
    let mMessageText = Expression<String?>("messageText")
    let mMessageContentType = Expression<Int>("messageContentType")
    let mChatSessionId = Expression<Int64>("chatSessionId")
    let mMessageTime = Expression<Int64>("messageTime")
    let mMessageImageData = Expression<Data?>("imageData")
    let mMessageImageWidth = Expression<Int>("imageWidth")
    let mMessageImageHeight = Expression<Int>("imageHeight")
    
    // Chat Table
    let cFromUid = Expression<Int64>("fromUid")
    let cReceiverUid = Expression<Int64>("receiverUid")
    let cNickName = Expression<String?>("nickName")
    let cUserId = Expression<Int64>("userId")
    let cAvatarUrl = Expression<String?>("avatarUrl")
    let cMessageText = Expression<String?>("messageText")
    let cMessageContentType = Expression<Int>("messageContentType")
    let cChatSessionId = Expression<Int64>("chatSessionId")
    let cLastMessageTime = Expression<Int64>("lastMessageTime")
    
    
    init() {
        db = try! Connection("\(path)/db.sqlite3")
        print("path = \(path)")
        self.createChatSessionTable()
        self.createMessageTable()
        self.initChatTable()
        self.initMessageTable()
    }
    
    private func createChatSessionTable() {
        let chatTable = Table("chatTable")
        
        try! db.run(chatTable.create(ifNotExists: true, block: { (table) in
            table.column(cChatSessionId, primaryKey: true)
            table.column(cFromUid)
            table.column(cReceiverUid)
            table.column(cNickName)
            table.column(cUserId)
            table.column(cAvatarUrl)
            table.column(cMessageText)
            table.column(cMessageContentType)
            table.column(cLastMessageTime)
            print("create chatTable")
        }))
    }
    
    private func createMessageTable() {
        let messageTable = Table("messageTable")
        
        try! db.run(messageTable.create(ifNotExists: true, block: { (table) in
            table.column(mMessageId, primaryKey: true)
            table.column(mFromUid)
            table.column(mReceiverUid)
            table.column(mFromUserName)
            table.column(mReceiverUserName)
            table.column(mFromUserAvatarUrl)
            table.column(mReceiverUserAvatarUrl)
            table.column(mMessageText)
            table.column(mMessageContentType)
            table.column(mMessageTime)
            table.column(mChatSessionId)
            table.column(mMessageImageData)
            table.column(mMessageImageWidth)
            table.column(mMessageImageHeight)
            print("create messageTable")
        }))
    }
    
    // 构造初始测试数据
    private func initMessageTable() {
        let messageTable = Table("messageTable")
        let result = try! db.prepare(messageTable)
        let messageList = Array(result)
        if messageList.count == 0 {
            print("message is empty")
            
            // 赵钱
            var insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 101,mFromUserName <- "赵先生",mReceiverUserName <- "钱先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",mMessageText <- "这是第一次发消息",mMessageContentType <- 1,mMessageTime <- 1631370073,mChatSessionId <- 1,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            var rowid = try! db.run(insert)
            
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 101,mFromUserName <- "赵先生",mReceiverUserName <- "钱先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",mMessageText <- "继续向你发消息",mMessageContentType <- 1,mMessageTime <- 1631371073,mChatSessionId <- 1,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            insert = messageTable.insert(mFromUid <- 101, mReceiverUid <- 100,mFromUserName <- "钱先生",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "我已经收到了，不用再发了",mMessageContentType <- 1,mMessageTime <- 1631372073,mChatSessionId <- 1,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            insert = messageTable.insert(mFromUid <- 101, mReceiverUid <- 100,mFromUserName <- "钱先生",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，真的不用再发了，",mMessageContentType <- 1,mMessageTime <- 1631373073,mChatSessionId <- 1,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 101,mFromUserName <- "赵先生",mReceiverUserName <- "钱先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",mMessageText <- "这是最新的消息",mMessageContentType <- 1,mMessageTime <- 1631377073,mChatSessionId <- 1,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵孙
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 102,mFromUserName <- "赵先生",mReceiverUserName <- "孙先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/2_head@2x.png?raw=true",mMessageText <- "你好，我是老赵",mMessageContentType <- 1,mMessageTime <- 1631377073,mChatSessionId <- 2,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            insert = messageTable.insert(mFromUid <- 102, mReceiverUid <- 100,mFromUserName <- "孙先生",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/2_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "你好，我是老孙",mMessageContentType <- 1,mMessageTime <- 1631378073,mChatSessionId <- 2,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵李
            insert = messageTable.insert(mFromUid <- 103, mReceiverUid <- 100,mFromUserName <- "李先生",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/3_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "你好，我是老李",mMessageContentType <- 1,mMessageTime <- 1631379073,mChatSessionId <- 3,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵周
            insert = messageTable.insert(mFromUid <- 104, mReceiverUid <- 100,mFromUserName <- "周女士",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/4_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "你好，我是周女士",mMessageContentType <- 1,mMessageTime <- 1631380073,mChatSessionId <- 4,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵吴
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 105,mFromUserName <- "赵先生",mReceiverUserName <- "吴女士",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/5_head@2x.png?raw=true",mMessageText <- "你好，我是赵先生",mMessageContentType <- 1,mMessageTime <- 1631381073,mChatSessionId <- 5,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵郑
            insert = messageTable.insert(mFromUid <- 106, mReceiverUid <- 100,mFromUserName <- "郑女士",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/6_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "你好，我是美丽善良的郑女士",mMessageContentType <- 1,mMessageTime <- 1631382073,mChatSessionId <- 6,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵王
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 107,mFromUserName <- "赵先生",mReceiverUserName <- "王女士",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/7_head@2x.png?raw=true",mMessageText <- "美丽善良的王女士，你好啊",mMessageContentType <- 1,mMessageTime <- 1631383073,mChatSessionId <- 7,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵冯
            insert = messageTable.insert(mFromUid <- 108, mReceiverUid <- 100,mFromUserName <- "冯先生",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/8_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "我是上海滩冯先生",mMessageContentType <- 1,mMessageTime <- 1631384073,mChatSessionId <- 8,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵陈
            insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 109,mFromUserName <- "赵先生",mReceiverUserName <- "陈女士",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/9_head@2x.png?raw=true",mMessageText <- "陈女士，你好，我是老赵",mMessageContentType <- 1,mMessageTime <- 1631385073,mChatSessionId <- 9,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
            
            // 赵金
            insert = messageTable.insert(mFromUid <- 110, mReceiverUid <- 100,mFromUserName <- "金女士",mReceiverUserName <- "赵先生",mFromUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/10_head@2x.png?raw=true",mReceiverUserAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/11_head@2x.png?raw=true",mMessageText <- "我是小金",mMessageContentType <- 1,mMessageTime <- 1631386073,mChatSessionId <- 10,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
            rowid = try! db.run(insert)
        }
    }
    
    // 用于构造初始测试数据
    private func initChatTable() {
        let chatTable = Table("chatTable")
        let result = try! db.prepare(chatTable)
        let chatList = Array(result)
        if chatList.count == 0 {
            print("chat is empty")
            var insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 101,cNickName <- "钱先生",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/1_head@2x.png?raw=true",cMessageText <- "这是最新的消息",cMessageContentType <- 1,cLastMessageTime <- 1631377073,cUserId <- 101)
            var rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 102, cReceiverUid <- 100,cNickName <- "孙先生",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/2_head@2x.png?raw=true",cMessageText <- "你好，我是老孙",cMessageContentType <- 1,cLastMessageTime <- 1631378073,cUserId <- 102)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 103, cReceiverUid <- 100,cNickName <- "李先生",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/3_head@2x.png?raw=true",cMessageText <- "你好，我是老李",cMessageContentType <- 1,cLastMessageTime <- 1631379073, cUserId <- 103)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 104, cReceiverUid <- 100,cNickName <- "周女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/4_head@2x.png?raw=true",cMessageText <- "你好，我是周女士",cMessageContentType <- 1,cLastMessageTime <- 1631380073, cUserId <- 104)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 105,cNickName <- "吴女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/5_head@2x.png?raw=true",cMessageText <- "你好，我是赵先生",cMessageContentType <- 1,cLastMessageTime <- 1631381073, cUserId <- 105)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 106, cReceiverUid <- 100,cNickName <- "郑女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/6_head@2x.png?raw=true",cMessageText <- "你好，我是美丽善良的郑女士",cMessageContentType <- 1,cLastMessageTime <- 1631382073, cUserId <- 106)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 107,cNickName <- "王女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/7_head@2x.png?raw=true",cMessageText <- "美丽善良的王女士，你好啊",cMessageContentType <- 1,cLastMessageTime <- 1631383073,cUserId <- 107)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 108, cReceiverUid <- 100,cNickName <- "冯先生",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/8_head@2x.png?raw=true",cMessageText <- "我是上海滩冯先生",cMessageContentType <- 1,cLastMessageTime <- 1631384073, cUserId <- 108)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 109,cNickName <- "陈女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/9_head@2x.png?raw=true",cMessageText <- "陈女士，你好，我是老赵",cMessageContentType <- 1,cLastMessageTime <- 1631385073, cUserId <- 109)
            rowid = try! db.run(insert)
            
            insert = chatTable.insert(cFromUid <- 110, cReceiverUid <- 100,cNickName <- "金女士",cAvatarUrl <- "https://github.com/acBool/picture/blob/master/202109/10_head@2x.png?raw=true",cMessageText <- "我是小金",cMessageContentType <- 1,cLastMessageTime <- 1631386073,cUserId <- 110)
            rowid = try! db.run(insert)
        }
    }
}


extension FWCSqlTool {
    // public method
    
    func addKeyValueToDict(key: String, value: Any, dict: inout [String: Any]) {
        dict[key] = value
    }
    
    func getChatModelFromSql(_ dataSourceArray: inout [FWCChatModel]) {
        let chatTable = Table("chatTable")
        do {
            for chat in try db.prepare(chatTable) {
                var dict: [String: Any] = [:]
                addKeyValueToDict(key: "fromUid", value: chat[cFromUid], dict: &dict)
                addKeyValueToDict(key: "receiverUid", value: chat[cReceiverUid], dict: &dict)
                addKeyValueToDict(key: "nickName", value: chat[cNickName], dict: &dict)
                addKeyValueToDict(key: "avatarUrl", value: chat[cAvatarUrl], dict: &dict)
                addKeyValueToDict(key: "messageText", value: chat[cMessageText], dict: &dict)
                addKeyValueToDict(key: "messageContentType", value: chat[cMessageContentType], dict: &dict)
                addKeyValueToDict(key: "chatSessionId", value: chat[cChatSessionId], dict: &dict)
                addKeyValueToDict(key: "lastMessageTime", value: chat[cLastMessageTime], dict: &dict)
                addKeyValueToDict(key: "userId", value: chat[cUserId], dict: &dict)
                //print(dict)
                let chatModel = FWCChatModel.createModel(dict: dict)
                dataSourceArray.append(chatModel)
            }
        }catch {
            
        }
    }
    
    
    func getMessageModelFromSql(chatId: Int64, dataSourceArray: inout [FWCMessageModel]) {
        let messageTable = Table("messageTable").filter(mChatSessionId == chatId).order(mMessageTime)
        do {
            for message in try db.prepare(messageTable) {
                var dict: [String: Any] = [:]
                addKeyValueToDict(key: "fromUid", value: message[mFromUid], dict: &dict)
                addKeyValueToDict(key: "receiverUid", value: message[mReceiverUid], dict: &dict)
                addKeyValueToDict(key: "fromUserName", value: message[mFromUserName], dict: &dict)
                addKeyValueToDict(key: "receiverUserName", value: message[mReceiverUserName], dict: &dict)
                addKeyValueToDict(key: "fromUserAvatarUrl", value: message[mFromUserAvatarUrl], dict: &dict)
                addKeyValueToDict(key: "receiverUserAvatarUrl", value: message[mReceiverUserAvatarUrl], dict: &dict)
                addKeyValueToDict(key: "messageText", value: message[mMessageText], dict: &dict)
                addKeyValueToDict(key: "messageContentType", value: message[mMessageContentType], dict: &dict)
                addKeyValueToDict(key: "messageTime", value: message[mMessageTime], dict: &dict)
                addKeyValueToDict(key: "chatSessionId", value: message[mChatSessionId], dict: &dict)
                addKeyValueToDict(key: "messageImageWidth", value: message[mMessageImageWidth], dict: &dict)
                addKeyValueToDict(key: "messageImageHeight", value: message[mMessageImageHeight], dict: &dict)
                addKeyValueToDict(key: "messageImageData", value: message[mMessageImageData], dict: &dict)
                //print(dict)
                let messageModel = FWCMessageModel.createModel(dict: dict)
                dataSourceArray.append(messageModel)
            }
        }catch {
            print("error")
        }
    }
    
    
    func insertMessageToDB(message: String,model: FWCChatModel) {
        let messageTable = Table("messageTable")
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let timeStamp = Int64(timeInterval)
        let insert = messageTable.insert(mFromUid <- FWCUser.getUid(), mReceiverUid <- model.userId,mFromUserName <- FWCUser.getUserName(),mReceiverUserName <- model.nickName,mFromUserAvatarUrl <- FWCUser.getUserAvatar(),mReceiverUserAvatarUrl <- model.avatarUrl,mMessageText <- message,mMessageContentType <- 1,mMessageTime <- timeStamp,mChatSessionId <- model.chatSessionId,mMessageImageHeight <- 0,mMessageImageWidth <- 0,mMessageImageData <- Data())
        let rowid = try! db.run(insert)
    }
    
    func insertImageMessageToDB(imageData: Data?, width: Int, height: Int, model: FWCChatModel) {
        let messageTable = Table("messageTable")
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let timeStamp = Int64(timeInterval)
        let insert = messageTable.insert(mFromUid <- FWCUser.getUid(), mReceiverUid <- model.userId,mFromUserName <- FWCUser.getUserName(),mReceiverUserName <- model.nickName,mFromUserAvatarUrl <- FWCUser.getUserAvatar(),mReceiverUserAvatarUrl <- model.avatarUrl,mMessageText <- "",mMessageContentType <- 2,mMessageTime <- timeStamp,mChatSessionId <- model.chatSessionId,mMessageImageHeight <- height,mMessageImageWidth <- width,mMessageImageData <- imageData)
        let rowid = try! db.run(insert)
    }
    
    func updateChatTable(message: String, model: FWCChatModel,isImage: Bool) {
        let chatTable = Table("chatTable")
        let alice = chatTable.filter(cChatSessionId == model.chatSessionId)
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let timeStamp = Int64(timeInterval)
        if isImage {
            let rowid = try! db.run(alice.update(cFromUid <- FWCUser.getUid(),cReceiverUid <- model.userId,cMessageText <- "", cLastMessageTime <- timeStamp, cMessageContentType <- 2))
        }else{
            let rowid = try! db.run(alice.update(cFromUid <- FWCUser.getUid(),cReceiverUid <- model.userId,cMessageText <- message, cLastMessageTime <- timeStamp, cMessageContentType <- 1))
        }
    }
}
