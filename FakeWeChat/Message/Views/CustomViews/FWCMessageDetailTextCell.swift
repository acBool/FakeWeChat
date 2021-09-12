//
//  FWCMessageDetailTextCell.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailTextCell: FWCMessageDetailBaseCell {

    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = FWCStyle.shared.messageDetailTextColor()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.addSubview(bgImageView)
        bgImageView.addSubview(contentLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FWCMessageDetailTextCell {
    // 右侧布局
    func layoutToRight(_ cellFrame: FWCDetailCellFrame) {
        headImageView.frame = CGRect(x: ScreenWidth - RS(40), y: RS(10), width: RS(30), height: RS(30))
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: RS(5))
        headImageView.layer.mask = shapeLayer
        
        let stretchImage = UIImage(named: "fwc_message_detail_sender_bg")!
        let bubbleImage = stretchImage.resizableImage(withCapInsets: UIEdgeInsets.init(top: 30, left: 28, bottom: 85, right: 28), resizingMode: .stretch)
        self.bgImageView.image = bubbleImage
        self.bgImageView.frame = CGRect(x: ScreenWidth - RS(40) - RS(20) - cellFrame.width, y: RS(10), width: cellFrame.width + RS(10), height: cellFrame.height + RS(10))
        
        contentLabel.frame = CGRect(x: RS(10), y:RS(5), width: cellFrame.width - RS(10), height: cellFrame.height - RS(10))
    }
    
    // 左侧布局
    func layoutToLeft(_ cellFrame: FWCDetailCellFrame) {
        headImageView.frame = CGRect(x: RS(10), y: RS(10), width: RS(30), height: RS(30))
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: RS(5))
        headImageView.layer.mask = shapeLayer
        
        let stretchImage = UIImage(named: "fwc_message_datail_receiver_bg")!
        let bubbleImage = stretchImage.resizableImage(withCapInsets: UIEdgeInsets.init(top: 30, left: 28, bottom: 85, right: 28), resizingMode: .stretch)
        self.bgImageView.image = bubbleImage
        self.bgImageView.frame = CGRect(x: RS(40) + RS(10), y: RS(10), width: cellFrame.width + RS(10), height: cellFrame.height + RS(10))
        
        contentLabel.frame = CGRect(x: RS(10), y:RS(5), width: cellFrame.width - RS(10), height: cellFrame.height - RS(10))
    }
}


extension FWCMessageDetailTextCell {
    func bindData(model: FWCMessageModel, cellFrame: FWCDetailCellFrame) {
        if FWCUser.isFromMe(model){
            // 说明是自己发的消息
            layoutToRight(cellFrame)
        }else{
            layoutToLeft(cellFrame)
        }
        
        if model.fromUserAvatarUrl.count > 0 {
            headImageView.af.setImage(withURL: URL(string: model.fromUserAvatarUrl)!)
        }
        contentLabel.text = model.messageText
    }
}
