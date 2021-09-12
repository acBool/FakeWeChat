//
//  FWCMessageDetaiiBottomBarView.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailBottomBarView: UIView {

    lazy var textView: UITextView = {
        let view = UITextView()
        view.textColor = FWCStyle.shared.messageDetailTextColor()
        view.font = UIFont.systemFont(ofSize: 13)
        view.returnKeyType = .send
        return view
    }()
    
    lazy var actionBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "fwc_message_detail_function_btn"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textView)
        addSubview(actionBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textView.pin.left(RS(15)).top(RS(10)).right(RS(60)).height(RS(40))
        self.actionBtn.pin.top(RS(10)).right(RS(10)).width(RS(40)).height(RS(40))
    }
    
}
