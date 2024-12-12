//
//  LoginButton.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 01/12/24.
//


import SwiftUI

struct DeemaButton : View {
    let tapped:()->Void
    var color:Color = .buttonActive
    var topPadding = 24.0
    var title = "Login / Sign Up"
    var body: some View {
        Button{
            tapped()
        }label: {
            Text(title)
                .loginButtonStyle(colour: color)
                .padding(.top , topPadding)
        }
    }
}

struct LoginButtonWithLoader : View {
    let tapped:()->Void
    var color:Color = .buttonActive
    var topPadding = 24.0
    var title = "Login / Sign Up"
    @Binding var isLoading:Bool
    
    var body: some View {
        Button{
            tapped()
        }label: {
            if !isLoading{
                Text(title)
                    .loginButtonStyle(colour: color)
                    .padding(.top , topPadding)
            }else {
                ActivityIndicator(isAnimating: $isLoading, style: .medium)
                    .loginButtonStyle(colour: color)
                    .padding(.top , topPadding)
                    
            }
        }
        .disabled(isLoading)
    }
}

