//
//  FeedAPIs.swift
//  MatchedU
//
//  Created by Taimur imam on 20/02/24.
//

import Foundation
import UIKit
import Alamofire

let product_environment = Environment.sandbox

var BaseUrl : String{
    if product_environment == .production{
        return "https://staging-api.deema.me/api/merchant/v1/purchase"
    }else{// for sandbox base url
        return "https://staging-api.deema.me/api/merchant/v1/purchase"
    }
}

struct MerchantAPI {
    
    let merchantUrl: String = "https://staging-api.deema.me/api/merchant/v1/purchase"
    
    func createMerchantOrder(sdk_key : String ,  merchantOrderId : String , amount : String , currency : String,  onCompletion: @escaping (_ _response : ResponseModel ,  _ statusCode : Int ) -> Void) {
      //  showHud()
        let params = [
            "merchant_order_id" : merchantOrderId ,
            "amount" : amount ,
            "currency_code" : currency
        ]
        
        let headers: HTTPHeaders = [
            "source": "sdk",
            "Authorization" : "Basic \(sdk_key)"
        ]
        
        AF.request(URL(string: BaseUrl)!, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers ).responseJSON
            { (response) in
                print(response)

            }

        
//        APIManager.post(urlString: BaseUrl , withParams:params, andHeaders:headers ) { responseModel, status_code  in
//            onCompletion(responseModel  , status_code)
//        }
    }
    
}
