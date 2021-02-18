//
//  ButtonStyle.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 18.02.2021.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Colors.secondary : Colors.main)
            .foregroundColor(.black)
            .cornerRadius(12)
            .padding()
    }
    
}
