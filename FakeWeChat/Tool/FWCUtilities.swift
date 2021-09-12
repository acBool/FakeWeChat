//
//  FWCUtilities.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import Foundation
import UIKit
import SwifterSwift
import PinLayout

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

func RS(_ distance: CGFloat) -> CGFloat {
    return FWCStyle.shared.ratioDistanceSize(size: distance)
}

func RFS(_ fontSize: CGFloat) -> CGFloat {
    return FWCStyle.shared.ratioFontSize(size: fontSize)
}

func cornerShapeLayer(view operateView: UIView, radius cornerRadius: CGFloat) -> CAShapeLayer {
    let maskPath = UIBezierPath.init(roundedRect: operateView.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
    let maskLayer = CAShapeLayer.init()
    maskLayer.frame = operateView.bounds
    maskLayer.path = maskPath.cgPath
    return maskLayer
}


func formatTimeStamp(time:Int ) -> Date {
    let timeInterval = TimeInterval(time)
    return Date(timeIntervalSince1970: timeInterval)
}

func formatMessageTime(messageTime: Int) -> String {
    let currentDate = Date()
    let messageDate = formatTimeStamp(time: messageTime)
    
    if currentDate.year == messageDate.year && currentDate.month == messageDate.month && currentDate.day == messageDate.day {
        // 年月日都相等
        return String(format:"%02x" ,messageDate.hour) + ":" + String(format:"%02x" ,messageDate.minute)
    }else if currentDate.year == messageDate.year {
        // 年相等，月日不等
        return String(format:"%02x" ,messageDate.month) + "-" + String(format:"%02x" ,messageDate.day) + " " + String(format:"%02x" ,messageDate.hour) + ":" + String(format:"%02x" ,messageDate.minute)
    }else{
        // 年月日都不等
        return String(messageDate.year) + "-" + String(format:"%02x" ,messageDate.month) + "-" + String(format:"%02x" ,messageDate.day) + " " + String(format:"%02x" ,messageDate.hour) + ":" + String(format:"%02x" ,messageDate.minute)
    }
}


func calculateContentSize(content: String) -> (width: CGFloat, height: CGFloat){
    let maxWidth = ScreenWidth - RS(100)
    let size = content.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0)], context: nil).size
    return (width: size.width.ceil + RS(10), height: size.height.ceil + RS(10))
}
