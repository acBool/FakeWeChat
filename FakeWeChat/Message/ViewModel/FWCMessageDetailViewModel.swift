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
        return 100
//        if indexPath.row < cellFrameArray.count {
//            let cellFrame: TableHomeListCellFrame = cellFrameArray[indexPath.row]
//            if cellFrame.height > 0 {
//                return cellFrame.height
//            }
//        }
//        return kDefaultCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
            cell?.bindData(model: model)
            return cell!
        }
        return UITableViewCell()
        
        //        if indexPath.row < self.dataSourceArray.count {
//            let model: FWCChatModel = dataSourceArray[indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "FWCMessageListCell") as? FWCMessageListCell
//            if cell == nil {
//                return FWCMessageListCell(style: .default, reuseIdentifier: "FWCMessageListCell")
//            }
//            cell?.bindData(model: model)
//            return cell!
//        }
    }
}
