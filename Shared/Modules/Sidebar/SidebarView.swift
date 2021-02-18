//
//  SidebarView.swift
//  RateMe (iOS)
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

extension SidebarView {
    struct Constants {
        let minSidebarWidth: CGFloat = 200
        let idealSidebarWidth: CGFloat = 300
        let maxSidebarWidth: CGFloat = 400
    }
}

struct SidebarView: View {
    
    // MARK: - Dependencies
    
    @Binding var selection : Set<NavigationItems>
    
    // MARK: - Private properties
    
    @ObservedObject private var rateData = RateData()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                Text(Localizable.sidebarMain.rawValue)

                Group{
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarCategories.rawValue, systemImage: Icons.list)
                    }
                    .tag(NavigationItems.categories)
                    
                    NavigationLink(destination: MyRatesView(data: rateData)) {
                        Label(Localizable.sidebarAllRates.rawValue, systemImage: Icons.rates)
                    }
                    .tag(NavigationItems.myRates)
                    
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarFavourites.rawValue, systemImage: Icons.favourite)
                    }
                    .tag(NavigationItems.favouriteRates)
                    
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarRecentlyAdded.rawValue, systemImage: Icons.recent)
                    }
                    .tag(NavigationItems.recentRates)
                }
                
                Divider()
                
                Text(Localizable.sidebarProfile.rawValue)
                
                Group {
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarSettings.rawValue, systemImage: Icons.settings)
                    }
                    .tag(NavigationItems.account)
                    
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarAccount.rawValue, systemImage: Icons.account)
                    }
                    .tag(NavigationItems.settings)
                }
            }
            .navigationTitle(Localizable.commonRateMeApp.rawValue)
            .listStyle(SidebarListStyle())
            .toolbar {
                #if os(macOS)
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: Icons.sidebarLeft)
                    })
                }
                #endif
            }
            .frame(
                minWidth: Constants().minSidebarWidth,
                idealWidth: Constants().idealSidebarWidth,
                maxWidth: Constants().maxSidebarWidth
            )
            
            MyRatesView(data: rateData)
        }
    }
    
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}
