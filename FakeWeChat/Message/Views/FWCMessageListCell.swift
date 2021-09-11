//
//  FWCMessageListCell.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import UIKit

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
        layer.foregroundColor = FWCStyle.shared.messageListNameColor().cgColor
        layer.alignmentMode = .left
        layer.fontSize = RFS(12.0)
        return layer
    }()
    
    
    lazy var dateLayer: CATextLayer = {
        let layer = CATextLayer()
        layer.backgroundColor = FWCStyle.shared.mainBgColor().cgColor
        layer.foregroundColor = FWCStyle.shared.messageListNameColor().cgColor
        layer.alignmentMode = .left
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
        
    }
    
}
