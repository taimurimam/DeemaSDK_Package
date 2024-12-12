//
//  File.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 30/11/24.
//


//
//  ColorExtension.swift
//  DeemaSDK
//  Created by Taimur imam on 11/11/24.

import SwiftUICore


extension Color {
    public static var blackTextColor: Color {
        Color(red: 5/255, green: 11/255, blue: 30/255)
    }
    public static var borderColor: Color {
        Color(red: 232/255, green: 232/255, blue: 232/255)
    }

    public static var placeholder: Color {
        Color(red: 164/255, green: 164/255, blue: 164/255)
    }

    public static var buttonInActive: Color {
        Color(red: 240/255, green: 214/255, blue: 220/255)
    }
    
    public static var buttonActive: Color {
        Color(red: 212/255, green: 138/255, blue: 154/255)
    }
    
    public static var redAlert: Color {
        Color(red: 234/255, green: 67/255, blue: 53/255)
    }
    
    public static var authenticBackGround: Color {
        Color(red: 232/255, green: 232/255, blue: 232/255)
    }
    
    public static var paymentBackGround: Color {
        Color(red: 242/255, green: 242/255, blue: 242/255)
    }

    
}


extension Int {
    /// Converts the integer to a string with an ordinal suffix.
    func toOrdinal() -> String {
        let suffix: String
        let remainder10 = self % 10
        let remainder100 = self % 100

        if (11...13).contains(remainder100) {
            suffix = "th"
        } else {
            switch remainder10 {
            case 1: suffix = "st"
            case 2: suffix = "nd"
            case 3: suffix = "rd"
            default: suffix = "th"
            }
        }
        
        return "\(self)\(suffix)"
    }
}

extension Double {
    func roundedToTwoDecimalPlaces() -> Double {
        return (self * 100).rounded() / 100
    }
    func toTwoDecimalPlaces() -> String {
        return String(format: "%.2f", self)
    }

}

extension String {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           let today = Date()
        let todayString = dateFormatter.string(from: today)
        if self == todayString {
            return "Today"
        }else
        if self.count > 10 {
            return String(prefix(10))
        }else {
            return self
        }
    }
}
