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
