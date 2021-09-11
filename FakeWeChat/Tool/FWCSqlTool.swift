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
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    var db: Connection?
    
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
    
    // Chat Table
    let cFromUid = Expression<Int64>("fromUid")
    let cReceiverUid = Expression<Int64>("receiverUid")
    let cNickName = Expression<String?>("nickName")
    let cAvatarUrl = Expression<String?>("avatarUrl")
    let cMessageText = Expression<String?>("messageText")
    let cMessageContentType = Expression<Int>("messageContentType")
    let cChatSessionId = Expression<Int64>("chatSessionId")
    let cLastMessageTime = Expression<Int64>("lastMessageTime")
    
    
    init() {
        db = try? Connection("\(path)/db.sqlite3")
        print("path = \(path)")
        self.createChatSessionTable()
        self.createMessageTable()
        //self.initMessageTable()
        self.initChatTable()
    }
    
    
    func createChatSessionTable() {
        let chatTable = Table("chatTable")
        
        try! db?.run(chatTable.create(ifNotExists: true, block: { (table) in
            table.column(cChatSessionId, primaryKey: true)
            table.column(cFromUid)
            table.column(cReceiverUid)
            table.column(cNickName)
            table.column(cAvatarUrl)
            table.column(cMessageText)
            table.column(cMessageContentType)
            table.column(cLastMessageTime)
            print("create chatTable")
        }))
    }
    
    func createMessageTable() {
        let messageTable = Table("messageTable")
        
        try! db?.run(messageTable.create(ifNotExists: true, block: { (table) in
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
            print("create messageTable")
        }))
    }
    
    func initMessageTable() {
        let messageTable = Table("messageTable")
        let result = try! db?.prepare(messageTable)
        let messageList = Array(result!)
        if messageList.count == 0 {
            print("message is empty")
            let insert = messageTable.insert(mFromUid <- 100, mReceiverUid <- 101,mFromUserName <- "赵一一",mReceiverUserName <- "钱二二")
            let rowid = try! db?.run(insert)
        }
    }
    
    // 用于构造初始测试数据
    func initChatTable() {
        let chatTable = Table("chatTable")
        let result = try! db?.prepare(chatTable)
        let chatList = Array(result!)
        if chatList.count == 0 {
            print("chat is empty")
            var insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 101,cNickName <- "钱先生",cAvatarUrl <- "钱二二",cMessageText <- "这是最新的消息",cMessageContentType <- 1,cLastMessageTime <- 1631377073)
            var rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 102, cReceiverUid <- 100,cNickName <- "孙先生",cAvatarUrl <- "钱二二",cMessageText <- "你好，我是老孙",cMessageContentType <- 1,cLastMessageTime <- 1631378073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 103, cReceiverUid <- 100,cNickName <- "李先生",cAvatarUrl <- "钱二二",cMessageText <- "你好，我是老李",cMessageContentType <- 1,cLastMessageTime <- 1631379073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 104, cReceiverUid <- 100,cNickName <- "周女士",cAvatarUrl <- "钱二二",cMessageText <- "你好，我是周女士",cMessageContentType <- 1,cLastMessageTime <- 1631380073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 105,cNickName <- "吴女士",cAvatarUrl <- "钱二二",cMessageText <- "你好，我是赵先生",cMessageContentType <- 1,cLastMessageTime <- 1631381073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 106, cReceiverUid <- 100,cNickName <- "郑女士",cAvatarUrl <- "钱二二",cMessageText <- "你好，我是美丽善良的郑女士",cMessageContentType <- 1,cLastMessageTime <- 1631382073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 107,cNickName <- "王女士",cAvatarUrl <- "钱二二",cMessageText <- "美丽善良的王女士，你好啊",cMessageContentType <- 1,cLastMessageTime <- 1631383073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 108, cReceiverUid <- 100,cNickName <- "冯先生",cAvatarUrl <- "钱二二",cMessageText <- "我是上海滩冯先生",cMessageContentType <- 1,cLastMessageTime <- 1631384073)
            rowid = try! db?.run(insert)
            
            insert = chatTable.insert(cFromUid <- 100, cReceiverUid <- 109,cNickName <- "陈女士",cAvatarUrl <- "钱二二",cMessageText <- "陈女士，你好，我是老赵",cMessageContentType <- 1,cLastMessageTime <- 1631385073)
            rowid = try! db?.run(insert)
        }
    }
}
