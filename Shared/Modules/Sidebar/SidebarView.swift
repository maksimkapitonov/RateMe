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
    var body: some View {
        NavigationView {
            List {
                Text(Localizable.sidebarMain.rawValue)

                Group{
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarCategories.rawValue, systemImage: Icons.list)
                    }
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarAllRates.rawValue, systemImage: Icons.rates)
                    }
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarFavourites.rawValue, systemImage: Icons.favourite)
                    }
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarRecentlyAdded.rawValue, systemImage: Icons.recent)
                    }
                }
                
                Divider()
                
                Text(Localizable.sidebarProfile.rawValue)
                
                Group {
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarSettings.rawValue, systemImage: Icons.settings)
                    }
                    NavigationLink(destination: Text(Localizable.commonInDev.rawValue)) {
                        Label(Localizable.sidebarAccount.rawValue, systemImage: Icons.account)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: Icons.sidebarLeft)
                    })
                }
            }
            .frame(
                minWidth: Constants().minSidebarWidth,
                idealWidth: Constants().idealSidebarWidth,
                maxWidth: Constants().maxSidebarWidth
            )
            
            Text(Localizable.commonInDev.rawValue)
        }
    }
    
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
