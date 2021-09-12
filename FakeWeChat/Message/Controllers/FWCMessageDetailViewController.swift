//
//  FWCMessageDetailViewController.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit
import ZLPhotoBrowser

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
        self.specView.actionView.textView.delegate = self
        self.specView.actionView.actionBtn.addTarget(self, action: #selector(openAlbum), for: .touchUpInside)
        
        self.getMessageFromSql()
    }
    
    func refreshMessageData() {
        DispatchQueue.main.async {
            self.specView.tableView.reloadData()
            let indexPath: IndexPath = IndexPath(row: self.viewModel.dataSourceArray.count - 1, section: 0)
            self.specView.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    func getMessageFromSql() {
        DispatchQueue.global().async {
            var dataSourceArray: [FWCMessageModel] = []
            FWCSqlTool.shared.getMessageModelFromSql(chatId: self.chatModel.chatSessionId, dataSourceArray: &dataSourceArray)
            if dataSourceArray.count > 0 {
                self.viewModel.dataSourceArray = dataSourceArray
                for _ in 1...dataSourceArray.count {
                    let cellFrame = FWCDetailCellFrame()
                    self.viewModel.cellFrameArray.append(cellFrame)
                }
                self.refreshMessageData()
            }
        }
    }
    
    func refreshChatSessionMessage(message: String) {
        DispatchQueue.global().async {
            FWCSqlTool.shared.updateChatTable(message: message, model: self.chatModel)
        }
    }
}


extension FWCMessageDetailViewController {
    @objc func openAlbum() {
        let configuration = ZLPhotoConfiguration()
        configuration.maxSelectCount = 1
        let ac = ZLPhotoPreviewSheet()
        
        ac.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            // your code
            print(images)
        }
        ac.showPhotoLibrary(sender: self)
        
    }
}


extension FWCMessageDetailViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if let message = textView.text {
                if message.count > 0 {
                    FWCSqlTool.shared.insertMessageToDB(message: message, model: self.chatModel)
                    textView.resignFirstResponder()
                    textView.text = ""
                    self.getMessageFromSql()
                    self.refreshChatSessionMessage(message: message)
                }
            }
            return false
        }
        return true
    }
}
