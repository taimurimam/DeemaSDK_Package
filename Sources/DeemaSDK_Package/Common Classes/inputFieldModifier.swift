//
//  inputFieldModifier.swift
//  DeemaSDKWebBased
//
//  Created by Taimur Imam on 01/12/24.
//



import SwiftUI

struct inputFieldModifier : ViewModifier{
    var colour : Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}


struct inputViewModifier : ViewModifier{
    var text_colour : Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}


struct login_btnModificer : ViewModifier{
    var color : Color
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .frame(height: 56)
            .background(color)
            .cornerRadius(16)
            .font(.appFont(type: .Regular, size: 16))
     }
}

struct paymentViewStyle : ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .shadow(color: .black.opacity(0.04), radius: 10 , x: 2 , y: 8)
            .cornerRadius(16)
     }
}

extension  View{
    func inputFieldStyle(text_colour : Color)->some View{
        modifier(inputFieldModifier(colour: text_colour))
    }
    
    func loginButtonStyle(colour : Color)->some View{
        modifier(login_btnModificer(color: colour))
    }
    func paymentViewModifier()->some View{
        modifier(paymentViewStyle( ))
    }
    
}

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
#endif

extension Notification.Name {
    static let message_upload_done = Notification.Name("videouploaddone")
}

extension String{
    var isItValidEmail: Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}
