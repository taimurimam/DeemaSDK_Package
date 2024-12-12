//
//  WebView.swift
//  DeemaSDK
//  Created by Taimur Imam on 28/11/24.


import SwiftyJSON
import SwiftUI
import WebKit
import Alamofire

import SwiftyJSON
struct MerchantResponse {
    var  purchase_id : String
    var  redirect_link : String
    var order_reference : String
    init(from json: JSON)
    {
        self.purchase_id = json["purchase_id"].stringValue
        self.redirect_link = json["redirect_link"].stringValue
        self.order_reference = json["order_reference"].stringValue
    }
}

enum Environment {
    case sandbox
    case production
}

public struct DeemaSDK: View {
    
     init(environment: Environment, merchantOrder_id: String, sdk_key: String, amount: String, currency: String) {
        self.environment = environment
        self.merchantOrder_id = merchantOrder_id
        self.sdk_key = sdk_key
        self.amount = amount
        self.currency = currency
        self.merchantResponse = MerchantResponse(from: JSON())
        self.message = ""
        self.isWebViewShow = false
        self.currentURL = ""
        self.showAlert = false
         
    }
    
    var environment : Environment
    @State  var merchantOrder_id : String
    var sdk_key : String
    @State  var amount : String = ""
    @State  var currency : String
    @State  var merchantResponse =  MerchantResponse(from: JSON())
    @State  var isLoading: Bool = false
    @State  var message = "Web View has been removed after payment completion."
    @State  var isWebViewShow: Bool = false
    @State  var currentURL: String = ""
    @State  var showAlert: Bool = false
  //  let paymentStatus:(_ status : PaymentStatus , _ message : String )-> Void
    
    public  var body: some View {
        ZStack{
            Color.authenticBackGround
                .ignoresSafeArea()
                .task {
                  //  product_environment = environment
                   // placeMerchantOrder()
                }
                    if  isWebViewShow {
                        if let url = URL(string: merchantResponse.redirect_link) {
                            WebView(url:url , currentURL: $currentURL, isRemove: $isWebViewShow, isLoading: $isLoading, paymentCompleted: {status,message in
                              //  paymentStatus(status,message)
                                if status == .success{
                                    print("Payment Successful")
                                }else
                                if status == .failure{
                                    print(message)
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    isWebViewShow = false
                                    showAlert.toggle()
                                }
                                
                            } )
                            .ignoresSafeArea()
                        }
                    }
            ActivityIndicator(isAnimating: $isLoading, style: UIActivityIndicatorView.Style.large)
        }
    }
    
    func placeMerchantOrder(){
        isLoading.toggle()
        
        MerchantAPI().createMerchantOrder(sdk_key: sdk_key , merchantOrderId: merchantOrder_id, amount: amount, currency: currency) { _response, status_code in
            let message  = _response.completeJsonResp["message"].stringValue
            print(_response.intResCode)
            if status_code == 200{
                merchantResponse = MerchantResponse(from: _response.completeJsonResp["data"])
                self.isWebViewShow.toggle()
            }else {
                self.message = message
              //  paymentStatus(.failure,self.message)
                isLoading.toggle()
            }
        }
    }
}


