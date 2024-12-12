//
//  FontType.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 30/11/24.
//


//
//  Untitled.swift
//  DeemaSDK
//
//  Created by Taimur imam on 11/11/24.
//

import SwiftUI

extension Font{
    enum FontType : Int {
        case Bold = 0
        case Regular
        case semibold
        case medium
        case extraBold
        case lite
    }
    
    static func appFont(type: FontType ,  size : Int)->Font{
        var  fontname = "Poppins-Regular"
        if type == .semibold{
            fontname = "Poppins-SemiBold"
        }else
        if type == .lite{
            fontname = "Poppins-Light"
        }else
        if type == .Regular{
            fontname = "Poppins-Regular"
        }else
        if type == .medium{
            fontname = "Poppins-Medium"
        }
        
        return Font.custom(fontname, size: CGFloat(size)) .weight(.bold)
    }
}

extension String {
    func removingPlus() -> String {
        return self.replacingOccurrences(of: "+", with: "")
    }
}
