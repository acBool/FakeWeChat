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
        view.font = FWCStyle.shared.messageDetailTextviewFont()
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
        self.textView.pin.left(RS(15)).top(kMarginSpace).right(RS(60)).height(kMessageListHeadWH)
        self.actionBtn.pin.top(kMarginSpace).right(kMarginSpace).width(kMessageListHeadWH).height(kMessageListHeadWH)
    }
    
}
