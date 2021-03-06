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
let kDefaultCellHeight = RS(50)
let kMessageListCellHeight = RS(70)
let kMessageDetailActionHeight = RS(70)
let kMarginSpace = RS(10)
let kMessageListHeadWH = RS(40)
let kMessageDetailHeadWH = RS(30)
let kRadiusCorner = RS(5)
let kTopMarginSpace = RS(15)
let kMessageListNameLeftMargin = RS(60)
let kMaxPicWH: CGFloat = 200
let kMaxPicDataLength = 1000 * 1000


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
        return String(format:"%02d" ,messageDate.hour) + ":" + String(format:"%02d" ,messageDate.minute)
    }else if currentDate.year == messageDate.year {
        // 年相等，月日不等
        return String(format:"%02d" ,messageDate.month) + "-" + String(format:"%02d" ,messageDate.day) + " " + String(format:"%02d" ,messageDate.hour) + ":" + String(format:"%02d" ,messageDate.minute)
    }else{
        // 年月日都不等
        return String(messageDate.year) + "-" + String(format:"%02d" ,messageDate.month) + "-" + String(format:"%02d" ,messageDate.day) + " " + String(format:"%02d" ,messageDate.hour) + ":" + String(format:"%02d" ,messageDate.minute)
    }
}


func calculateContentSize(content: String) -> (width: CGFloat, height: CGFloat){
    let maxWidth = ScreenWidth - RS(100)
    let size = content.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : FWCStyle.shared.messageDetailFont()], context: nil).size
    return (width: size.width.ceil + kMarginSpace, height: size.height.ceil + kMarginSpace)
}


func compressImageOnlength(maxLength: Int, image: UIImage) -> Data? {
        
    guard let vData = image.jpegData(compressionQuality: 1) else { return nil }
        if vData.count < maxLength {
            return vData
        }
        var compress:CGFloat = 0.9
    guard var data = image.jpegData(compressionQuality: compress) else { return nil }
        while data.count > maxLength && compress > 0.01 {
            compress -= 0.02
            data = image.jpegData(compressionQuality: compress)!
        }
        return data
}


func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(origin: .zero, size: newSize)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
}

