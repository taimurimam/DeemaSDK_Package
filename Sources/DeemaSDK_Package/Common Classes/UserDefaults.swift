//
//  Subscription.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 30/11/24.
//


import Foundation
//import SwiftyJSON
/*
extension UserDefaults
{
    static func saveString(value strVal:String, forKey strKey:UserDefaultsKeys)
    {
        self.standard.set(strVal as Any, forKey: strKey.rawValue)
        self.standard.synchronize()
    }
    
    static func  getString(forKey strKey:UserDefaultsKeys) -> String
    {
        let val = self.standard.object(forKey: strKey.rawValue)
        
        return "\(val ?? "")"
    }
    
    static func saveJSON(_ json: JSON,_ strKey: UserDefaultsKeys)
    {
        if let jsonString = json.rawString() {
            self.standard.setValue(jsonString, forKey: strKey.rawValue)
            self.standard.synchronize()
        }
    }
    
    static func getJSON(forKey strkey: UserDefaultsKeys) -> JSON
    {
        var finalJson = JSON()
        
        var strResult = ""
        if let result = UserDefaults.standard.string(forKey: strkey.rawValue)
        {
            strResult = result
        }
        
        if strResult != ""
        {
            if let json = strResult.data(using: String.Encoding.utf8, allowLossyConversion: false)
            {
                do
                {
                    finalJson =  try JSON(data: json)
                }
                catch
                {
                    print("Method: getJSON in UserDefaults. Unable to fetch json data")
                }
            }
        }
        
        return finalJson
    }
}

*/
