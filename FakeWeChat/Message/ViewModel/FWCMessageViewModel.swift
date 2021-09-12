//
//  FWCMessageViewModel.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/12.
//

import UIKit

class FWCMessageViewModel: NSObject {
    var dataSourceArray: [FWCChatModel] = []
    typealias selectBlock = (_ row: Int) ->Void
    var selectRowBlock: selectBlock?
}

extension FWCMessageViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.selectRowBlock != nil {
            self.selectRowBlock!(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.dataSourceArray.count {
            let model: FWCChatModel = dataSourceArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FWCMessageListCell") as? FWCMessageListCell
            if cell == nil {
                return FWCMessageListCell(style: .default, reuseIdentifier: "FWCMessageListCell")
            }
            cell?.bindData(model: model)
            return cell!
        }
        return UITableViewCell()
    }
}
