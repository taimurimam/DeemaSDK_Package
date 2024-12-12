//
//  MerchantAppView.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 05/12/24.
//

import SwiftUI
import SwiftyJSON

struct MerchantAppView : View {
    
    @State  private var merchant_id = "1726"
    @State  private var amount = "100"
    @State  private var currency = "KWD"
    @State  private var SDK_Key = "sk_test_d5gntxxdoRNGkAweKjWZMr8iocXd3oNO1Wz5VJuW_65"
    var environment = Environment.sandbox
    
    @State private var isDeemaSdkOpen = false
    var body: some View {
        ZStack{
            Color.authenticBackGround
                .ignoresSafeArea()
            if isDeemaSdkOpen{
                DeemaSDK(environment: environment, merchantOrder_id: merchant_id, sdk_key: SDK_Key , amount: amount, currency: currency )
            }else
            {
                VStack{
                    
                    Text("I am on merchant app, to open the deema sdk tap button")
                    TextField("merchant id" , text: $merchant_id)
                        .inputFieldStyle(text_colour: .black)
                    TextField("Amount" , text: $amount)
                        .inputFieldStyle(text_colour: .black)
                    TextField("SDK KEY" , text: $SDK_Key)
                        .inputFieldStyle(text_colour: .black)
                    TextField("Currency" , text: $currency)
                        .inputFieldStyle(text_colour: .black)
                    
                    DeemaButton(tapped: {
                        isDeemaSdkOpen.toggle()
                    } , title: "Open Deema SDK")
                }
                .padding()
            }
        }
    }
}



