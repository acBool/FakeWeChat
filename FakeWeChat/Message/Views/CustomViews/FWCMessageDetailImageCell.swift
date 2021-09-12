//
//  FWCMessageDetailImageCell.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageDetailImageCell: FWCMessageDetailBaseCell {

    lazy var messageImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        self.contentView.addSubview(messageImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindData(model: FWCMessageModel, cellFrame: FWCDetailCellFrame) {
        if FWCUser.isFromMe(model){
            // 说明是自己发的消息
            layoutToRight(cellFrame: cellFrame, model: model)
        }else{
            layoutToLeft(cellFrame: cellFrame, model: model)
        }
        
        if model.fromUserAvatarUrl.count > 0 {
            headImageView.af.setImage(withURL: URL(string: model.fromUserAvatarUrl)!)
        }
        
        if let imageData = model.imageData {
            let image = UIImage(data: imageData)
            messageImageView.image = image
        }
    }
}

extension FWCMessageDetailImageCell {
    func layoutToRight(cellFrame: FWCDetailCellFrame, model: FWCMessageModel) {
        headImageView.frame = CGRect(x: ScreenWidth - kMessageListHeadWH, y: kMarginSpace, width: kMessageDetailHeadWH, height: kMessageDetailHeadWH)
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: kRadiusCorner)
        headImageView.layer.mask = shapeLayer
        
        messageImageView.frame = CGRect(x: ScreenWidth - kMessageListHeadWH - kMarginSpace * 2 - CGFloat(model.imageWidth), y: kMarginSpace, width: CGFloat(model.imageWidth), height: CGFloat(model.imageHeight))
    }
    
    func layoutToLeft(cellFrame: FWCDetailCellFrame, model: FWCMessageModel) {
        headImageView.frame = CGRect(x: kMarginSpace, y: kMarginSpace, width: kMessageDetailHeadWH, height: kMessageDetailHeadWH)
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: kRadiusCorner)
        headImageView.layer.mask = shapeLayer
        
        messageImageView.frame = CGRect(x: kMessageListHeadWH + kMarginSpace, y: kMarginSpace, width: CGFloat(model.imageWidth), height: CGFloat(model.imageHeight))
    }
}
