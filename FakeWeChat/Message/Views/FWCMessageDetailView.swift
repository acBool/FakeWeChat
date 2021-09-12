//
//  FWCMessageDetailView.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = FWCStyle.shared.mainBgColor()
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.pin.all()
    }

}
