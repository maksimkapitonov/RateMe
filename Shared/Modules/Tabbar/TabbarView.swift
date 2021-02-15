//
//  TabbarView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                Text(Localizable.tabbarMyRates.rawValue)
                    .navigationTitle(Localizable.tabbarMyRates.rawValue)
            }
            .tabItem {
                Label(Localizable.tabbarMyRates.rawValue, systemImage: Icons.rates)
            }
            
            NavigationView {
                Text(Localizable.commonInDev.rawValue)
            }
            .tabItem {
                Label(Localizable.tabbarScan.rawValue, systemImage: Icons.scanBarcode)
            }
            
            NavigationView {
                Text(Localizable.commonInDev.rawValue)
                    .navigationTitle(Localizable.sidebarAccount.rawValue)
            }
            .tabItem {
                Label(Localizable.sidebarAccount.rawValue, systemImage: Icons.account)
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
