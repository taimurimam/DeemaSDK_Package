//
//  UserModel.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 30/11/24.
//


//
//  Conection.swift
//  DeemaSDK
//
//  Created by Taimur imam on 13/11/24.
//



import Foundation
import SwiftyJSON
import CoreLocation
import UIKit

// MARK: - UserModel


/*




 */

struct UserModel : Equatable , Hashable{
    
    func hash(into hasher: inout Hasher) {
        
       }
    var id: String
    var  phone_number  : String
    var access_token , idv_passed, focal_status , last_name , nationality , full_name_en , image ,  full_name_ar , foo_correlation_id ,zoho_id  , secondary_mobile_number , residence_type , language  , address  , is_deleted_at , payment_customer_id , date_of_birth , residence_expiry_date , max_credit_limit , gender , is_approve_terms_of_use , nationality_iso_3 , first_name , email , focal_reference  , salary:  String
    
    var isVerified , is_active  , is_deleted: Bool
    // Implement the == operator to conform to Equatable
        static func == (lhs: UserModel, rhs: UserModel) -> Bool {
            return lhs.id == rhs.id
        }
    
    init(from json: JSON)
    {
        let user = json["user"]
        self.id = user["id"].stringValue
        self.phone_number = user["phone_number"].stringValue
        self.access_token = json["access_token"].stringValue
        self.isVerified = user["is_verified"].boolValue
        self.salary = user["salary"].stringValue
        self.focal_reference = user["focal_reference"].stringValue
        self.email = user["email"].stringValue
        self.first_name = user["first_name"].stringValue
        self.nationality_iso_3 = user["nationality_iso_3"].stringValue
        self.is_approve_terms_of_use = user["is_approve_terms_of_use"].stringValue
        self.gender = user["gender"].stringValue
        self.max_credit_limit = user["max_credit_limit"].stringValue
        self.residence_expiry_date = user["residence_expiry_date"].stringValue
        self.date_of_birth = user["date_of_birth"].stringValue
        self.payment_customer_id = user["payment_customer_id"].stringValue
        self.is_deleted_at = user["is_deleted_at"].stringValue
        self.payment_customer_id = user["payment_customer_id"].stringValue
        self.is_deleted_at = user["is_deleted_at"].stringValue
        self.address = user["address"].stringValue
        self.is_active = user["is_active"].boolValue
        self.is_deleted = user["is_deleted"].boolValue
        self.language = user["language"].stringValue
        self.residence_type = user["residence_type"].stringValue
        self.secondary_mobile_number = user["secondary_mobile_number"].stringValue
        self.zoho_id = user["zoho_id"].stringValue
        self.foo_correlation_id = user["foo_correlation_id"].stringValue
        self.full_name_ar = user["full_name_ar"].stringValue
        self.image = user["image"].stringValue
        self.full_name_en = user["full_name_en"].stringValue
        self.last_name = user["last_name"].stringValue
        self.focal_status = user["focal_status"].stringValue
        self.idv_passed = user["idv_passed"].stringValue
        self.nationality = user["nationality"].stringValue 
    }
}

class LogedInUser : ObservableObject{
  //  @Published var user = loggedinUser
}

//
//class AppController
//{
//    static let shared = AppController()
//    
//    private var _userM: UserModel // Private storage for the userM
//    var isPad: Bool{
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            return true
//        }else{
//            return  false
//        }
//    }
//
//    var userM: UserModel {
//        get {
//            let json = UserDefaults.getJSON(forKey: .userDetails)
//            return UserModel(from: json)
//        }
//        set {
//            _userM = newValue
//        }
//    }
//    
//    private init(){
//        _userM = UserModel(from: JSON())
//    }
//}

//var isiPad: Bool{
//    AppController.shared.isPad
//}
//
//var loggedinUser: UserModel {
//    AppController.shared.userM
//}
//
//enum UserDefaultsKeys: String, CaseIterable {
//    case userDetails
//    case userId
//    case apiToken
//    case mediaUrl
//    case subscriontionDate
//    case isSubscription
//
//    
//}
