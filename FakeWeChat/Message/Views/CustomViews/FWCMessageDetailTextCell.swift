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
        self.contentView.addSubview(contentLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension FWCMessageDetailTextCell {
    // 右侧布局
    func layoutToRight() {
        headImageView.frame = CGRect(x: ScreenWidth - RS(40), y: RS(10), width: RS(30), height: RS(30))
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: RS(5))
        headImageView.layer.mask = shapeLayer
    }
    
    // 左侧布局
    func layoutToLeft() {
        headImageView.frame = CGRect(x: RS(10), y: RS(10), width: RS(30), height: RS(30))
        let shapeLayer = cornerShapeLayer(view: headImageView, radius: RS(5))
        headImageView.layer.mask = shapeLayer
    }
}


extension FWCMessageDetailTextCell {
    func bindData(model: FWCMessageModel) {
        if FWCUser.isFromMe(model){
            // 说明是自己发的消息
            layoutToRight()
        }else{
            layoutToLeft()
        }
        
        if model.fromUserAvatarUrl.count > 0 {
            headImageView.af.setImage(withURL: URL(string: model.fromUserAvatarUrl)!)
        }
    }
}
