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
    
    func tabbarTitleNormalColor() -> UIColor {
        return .black
    }
    
    func tabbarTitleSelectColor() -> UIColor {
        return UIColor(hex: 0x58bd6b)!
    }
    
    func messageListNameColor() -> UIColor {
        return UIColor(hex: 0x222222)!
    }
    
    func messageSpaceLineColor() -> UIColor {
        return UIColor(hex: 0xcccccc)!
    }
    
}


extension FWCStyle {
    // image
    
    func navigationItemBlackImage() -> String {
        return "ic_nav_black_back"
    }
    
    func messageAvatarHolderImage() -> String {
        return "fwc_message_avatar_holder"
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


extension FWCStyle {
    // distance
    
    func ratioDistanceSize(size: CGFloat) ->CGFloat {
        let width = ScreenWidth
        
        return ceil(size * width / 375.0)
    }
    
    func ratioFontSize(size: CGFloat) ->CGFloat {
        let width = ScreenWidth
        return ceil(size * width / 375.0)
    }
}