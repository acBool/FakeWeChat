//
//  FWCMessageDetailViewController.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailViewController: FWCBaseViewController {

    var chatModel: FWCChatModel
    lazy var viewModel: FWCMessageDetailViewModel = {
        let viewModel = FWCMessageDetailViewModel()
        return viewModel
    }()
    
    lazy var specView: FWCMessageDetailView = {
        let view = FWCMessageDetailView()
        view.backgroundColor = FWCStyle.shared.messageDetailBgColor()
        return view
    }()
        
    init(model: FWCChatModel) {
        self.chatModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.chatModel.nickName
        self.setupUI()
        self.setupData()
    }
    
}

extension FWCMessageDetailViewController {
    func setupUI() {
        specView.frame = self.view.bounds
        self.view.addSubview(specView)
    }
    
    func setupData() {
        self.specView.tableView.dataSource = self.viewModel
        self.specView.tableView.delegate = self.viewModel
        
        DispatchQueue.global().async {
            var dataSourceArray: [FWCMessageModel] = []
            FWCSqlTool.shared.getMessageModelFromSql(chatId: self.chatModel.chatSessionId, dataSourceArray: &dataSourceArray)
            if dataSourceArray.count > 0 {
                self.viewModel.dataSourceArray = dataSourceArray
                self.refreshMessageData()
            }
        }
    }
    
    func refreshMessageData() {
        DispatchQueue.main.async {
            self.specView.tableView.reloadData()
        }
    }
}
