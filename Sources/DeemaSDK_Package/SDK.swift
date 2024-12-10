//
//  SDK.swift
//  DeemaSDK_Package
//
//  Created by Taimur Imam on 10/12/24.
//


import SwiftUI

 

public struct SDK : View {
    public init(buttonTapped: @escaping () -> Void) {
        self.buttonTapped = buttonTapped
    }
    
    let buttonTapped: ()->Void

    public var body: some View {
        Text("I am sdk")
            .background(Color.white)
    }
}
