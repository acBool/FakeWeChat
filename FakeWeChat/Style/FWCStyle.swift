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
    
    func messageListTextColor() -> UIColor {
        return UIColor(hex: 0x8a8a8a)!
    }
    
    func messageSpaceLineColor() -> UIColor {
        return UIColor(hex: 0xeeeeee)!
    }
    
    func messageDetailTextColor() -> UIColor {
        return UIColor(hex: 0x222222)!
    }
    
    func messageDetailBgColor() -> UIColor {
        return UIColor(hex: 0xf3f3f3)!
    }
    
    func messageDetailActionBarBorderColor() -> UIColor {
        return UIColor(hex: 0xc2c3c7)!
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
    
    func tabbarMessageNormalImage() -> String {
        return "fwc_tabbar_message"
    }
    
    func tabbarMessageSelectImage() -> String {
        return "fwc_tabbar_message_select"
    }
    
    func tabbarContactsNormalImage() -> String {
        return "fwc_tabbar_contacts"
    }
    
    func tabbarContactsSelectImage() -> String {
        return "fwc_tabbar_contacts_select"
    }
    
    func tabbarDiscoveryNormalImage() -> String {
        return "fwc_tabbar_discover"
    }
    
    func tabbarDiscoverySelectImage() -> String {
        return "fwc_tabbar_discover_select"
    }
    
    func tabbarMeNormalImage() -> String {
        return "fwc_tabbar_me"
    }
    
    func tabbarMeSelectImage() -> String {
        return "fwc_tabbar_me_select"
    }
}


extension FWCStyle {
    // documents
    
    func messageTabbarTitle() -> String {
        return "??????"
    }
    
    func contactTabbarTitle() -> String {
        return "?????????"
    }
    
    func discoveryTabbarTitle() -> String {
        return "??????"
    }
    
    func meTabbarTitle() -> String {
        return "???"
    }
    
    func picMessageInfo() -> String {
        return "[??????]"
    }
}


extension FWCStyle {
    func messageDetailFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0)
    }
    
    func messageDetailTextviewFont() -> UIFont {
        return UIFont.systemFont(ofSize: 13.0)
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
