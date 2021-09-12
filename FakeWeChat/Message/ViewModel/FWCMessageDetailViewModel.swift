//
//  FWCMessageDetailViewModel.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

// 缓存布局信息
class FWCDetailCellFrame {
    var width: CGFloat = 0
    var height: CGFloat = 0
}

class FWCMessageDetailViewModel: NSObject {
    var dataSourceArray: [FWCMessageModel] = []
    var cellFrameArray: [FWCDetailCellFrame] = []
}


extension FWCMessageDetailViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 处理图片点击
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < cellFrameArray.count {
            let cellFrame: FWCDetailCellFrame = cellFrameArray[indexPath.row]
            if cellFrame.height > 0 {
                return cellFrame.height + RS(20)
            }
        }
        return RS(50)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < cellFrameArray.count {
            let cellFrame: FWCDetailCellFrame = cellFrameArray[indexPath.row]
            if cellFrame.height == 0 {
                // 高度需要计算
                let model: FWCMessageModel = dataSourceArray[indexPath.row]
                calculateCellFrame(cellFrame: cellFrame, model: model)
                return cellFrame.height + RS(20)
            }else{
                return cellFrame.height + RS(20)
            }
        }
        return RS(50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.dataSourceArray.count {
            let model: FWCMessageModel = dataSourceArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FWCMessageDetailTextCell") as? FWCMessageDetailTextCell
            if cell == nil {
                return FWCMessageDetailTextCell(style: .default, reuseIdentifier: "FWCMessageDetailTextCell")
            }
            let cellFrame: FWCDetailCellFrame = cellFrameArray[indexPath.row]
            if cellFrame.height == 0 {
                calculateCellFrame(cellFrame: cellFrame, model: model)
            }
            cell?.bindData(model: model, cellFrame: cellFrameArray[indexPath.row])
            return cell!
        }
        return UITableViewCell()
    }
}


extension FWCMessageDetailViewModel {
    func calculateCellFrame(cellFrame: FWCDetailCellFrame,model: FWCMessageModel) {
        let size = calculateContentSize(content: model.messageText)
        cellFrame.width = size.width
        cellFrame.height = size.height > RS(50) ? size.height : RS(50)
    }
}
