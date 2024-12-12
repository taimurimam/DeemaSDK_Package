//
//  ToastMessage.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 30/11/24.
//


//
//  ToastMessage.swift
//  DeemaSDK
//
//  Created by Taimur imam on 16/11/24.
//

import SwiftUI

struct ToastMessage: View {
    @State var message: String = "Please enter valid Phone Number"
    @Binding var isShowing: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 0
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image("toast_alert")
                        .padding(.leading)
                    Text(message)
                        .foregroundStyle(Color.blackTextColor)
                        .font(.appFont(type: .Regular, size: 16))

                    Spacer(minLength: 0)
                    Image("toastClose")
                        .padding()
                        .onTapGesture {
                            isShowing.toggle()
                        }
                }
                .background(Color.white)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke( Color.redAlert , lineWidth: 1.0 )
                )
                .padding(.horizontal)
                .padding(.top , 30)
                Spacer()
            }
            .task{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isShowing.toggle()
                }
            }
        }
    }
}

#Preview {
    ToastMessage( isShowing: .constant(false))
}
