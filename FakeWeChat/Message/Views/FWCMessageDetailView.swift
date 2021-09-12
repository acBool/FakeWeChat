//
//  FWCMessageDetailView.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailView: UIView {

    lazy var actionView: FWCMessageDetailBottomBarView = {
        let view = FWCMessageDetailBottomBarView()
        view.layer.borderWidth = 0.3
        view.layer.borderColor = FWCStyle.shared.messageDetailActionBarBorderColor().cgColor
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = FWCStyle.shared.messageDetailBgColor()
        tableView.register(FWCMessageDetailTextCell.self, forCellReuseIdentifier: "FWCMessageDetailTextCell")
        tableView.register(FWCMessageDetailImageCell.self, forCellReuseIdentifier: "FWCMessageDetailImageCell")
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
        addSubview(tableView)
        addSubview(actionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.pin.left().right().top().bottom(kMessageDetailActionHeight)
        actionView.pin.left().right().bottom().height(kMessageDetailActionHeight)
    }

}
