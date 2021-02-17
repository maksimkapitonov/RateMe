//
//  TabbarView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var selection : Set<NavigationItems>
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                MyRatesView()
            }
            .tag(NavigationItems.myRates)
            .tabItem {
                Label(Localizable.tabbarMyRates.rawValue, systemImage: Icons.rates)
            }
            
            NavigationView {
                Text(Localizable.commonInDev.rawValue)
            }
            .tag(NavigationItems.scan)
            .tabItem {
                Label(Localizable.tabbarScan.rawValue, systemImage: Icons.scanBarcode)
            }
            
            NavigationView {
                Text(Localizable.commonInDev.rawValue)
                    .navigationTitle(Localizable.sidebarAccount.rawValue)
            }
            .tag(NavigationItems.profile)
            .tabItem {
                Label(Localizable.sidebarAccount.rawValue, systemImage: Icons.account)
            }
        }
    }
    
}
