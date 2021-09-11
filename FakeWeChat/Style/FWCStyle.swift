//
//  FWCStyle.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import Foundation
import UIKit

class FWCStyle {
    
    static let shared = FWCStyle()
    
    // color
    
    func mainBgColor() -> UIColor {
        return .white
    }
    
//    func tabbarTitleNormalColor() -> UIColor {
//        return UIColor(hex: 0x000000)
//    }
    
}


extension FWCStyle {
    // image
    
    func navigationItemBlackImage() -> String {
        return "ic_nav_black_back"
    }
}


extension FWCStyle {
    // documents
    
    func messageTabbarTitle() -> String {
        return "微信"
    }
    
    func contactTabbarTitle() -> String {
        return "通讯录"
    }
    
    func discoveryTabbarTitle() -> String {
        return "发现"
    }
    
    func meTabbarTitle() -> String {
        return "我"
    }
}
