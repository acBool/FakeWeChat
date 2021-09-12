//
//  FWCMessageView.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageView: UIView {

    lazy var messageTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = FWCStyle.shared.mainBgColor()
        tableView.rowHeight = kMessageListCellHeight
        tableView.register(FWCMessageListCell.self, forCellReuseIdentifier: "FWCMessageListCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(messageTableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageTableView.pin.all()
    }
    
}
