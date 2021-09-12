//
//  FWCMessageViewController.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import UIKit

class FWCMessageViewController: FWCBaseViewController {

    lazy var viewModel: FWCMessageViewModel = {
        let viewModel = FWCMessageViewModel()
        viewModel.selectRowBlock = {[unowned self] (row: Int) in
            let model: FWCChatModel = self.viewModel.dataSourceArray[row]
            let detailVC = FWCMessageDetailViewController(model:model)
            detailVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        return viewModel
    }()
    
    lazy var specView: FWCMessageView = {
        let view = FWCMessageView()
        view.backgroundColor = FWCStyle.shared.mainBgColor()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = FWCStyle.shared.messageTabbarTitle()
        self.setupUI()
        self.setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getChatData()
    }

    func setupUI() {
        specView.frame = self.view.bounds
        view.addSubview(specView)
    }

}

extension FWCMessageViewController {
    func setupData() {
        self.specView.messageTableView.delegate = self.viewModel
        self.specView.messageTableView.dataSource = self.viewModel
    }
    
    func getChatData() {
        DispatchQueue.global().async {
            var dataSourceArray: [FWCChatModel] = []
            FWCSqlTool.shared.getChatModelFromSql(&dataSourceArray)
            if dataSourceArray.count > 0 {
                self.viewModel.dataSourceArray = dataSourceArray
                self.refreshMessageData()
            }
        }
    }
    
    func refreshMessageData() {
        DispatchQueue.main.async {
            self.specView.messageTableView.reloadData()
        }
    }
}
