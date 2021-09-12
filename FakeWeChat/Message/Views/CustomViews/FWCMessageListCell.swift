//
//  FWCMessageListCell.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import UIKit
import AlamofireImage

class FWCMessageListCell: UITableViewCell {

    lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: FWCStyle.shared.messageAvatarHolderImage())
        return imageView
    }()
    
    lazy var nickNameLayer: CATextLayer = {
        let layer = CATextLayer()
        layer.backgroundColor = FWCStyle.shared.mainBgColor().cgColor
        layer.foregroundColor = FWCStyle.shared.messageListNameColor().cgColor
        layer.alignmentMode = .left
        layer.fontSize = RFS(14.0)
        return layer
    }()
    
    lazy var messageLayer: CATextLayer = {
        let layer = CATextLayer()
        layer.backgroundColor = FWCStyle.shared.mainBgColor().cgColor
        layer.foregroundColor = FWCStyle.shared.messageListTextColor().cgColor
        layer.alignmentMode = .left
        layer.fontSize = RFS(11.0)
        return layer
    }()
    
    
    lazy var dateLayer: CATextLayer = {
        let layer = CATextLayer()
        layer.backgroundColor = FWCStyle.shared.mainBgColor().cgColor
        layer.foregroundColor = FWCStyle.shared.messageListTextColor().cgColor
        layer.alignmentMode = .right
        layer.fontSize = RFS(11.0)
        return layer
    }()
    
    lazy var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = FWCStyle.shared.messageSpaceLineColor()
        return view
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
        self.contentView.addSubview(headImageView)
        self.contentView.addSubview(spaceView)
        self.contentView.layer.addSublayer(nickNameLayer)
        self.contentView.layer.addSublayer(messageLayer)
        self.contentView.layer.addSublayer(dateLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headImageView.pin.left(kMarginSpace).top(RS(15)).width(kMessageListHeadWH).height(kMessageListHeadWH)
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: kRadiusCorner)
        headImageView.layer.mask = shapeLayer
        
        nickNameLayer.frame = CGRect(x: RS(60), y: RS(15), width: RS(200), height: RS(20))
        messageLayer.frame = CGRect(x: RS(60), y: nickNameLayer.frame.maxY + RS(2), width: RS(300), height: RS(15))
        dateLayer.frame = CGRect(x: ScreenWidth - RS(130), y: RS(15), width: RS(120), height: RS(15))
        spaceView.pin.left(RS(60)).right().bottom(0.5).height(0.5)
    }
    
}

extension FWCMessageListCell {
    func bindData(model: FWCChatModel) {
        self.nickNameLayer.string = model.nickName
        self.dateLayer.string = formatMessageTime(messageTime:Int(model.lastMessageTime))
        if model.avatarUrl.count > 0 {
            headImageView.af.setImage(withURL: URL(string: model.avatarUrl)!)
        }
        if model.messageContentType == .Text {
            self.messageLayer.string = model.messageText
        }else {
            self.messageLayer.string = "[图片]"
        }
    }
}
