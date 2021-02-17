//
//  InitialView.swift
//  Shared
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

struct InitialView: View {
    
    @State private var selection : Set<NavigationItems> = [.myRates]
    
    #if os(macOS)
    var body: some View {
        SidebarView(selection: $selection)
    }

    #else
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    var body: some View {
        if idiom == .phone {
            TabbarView(selection: $selection)
        } else if idiom == .pad {
            SidebarView(selection: $selection)
        } else {
            Text(Localizable.commonInDev.rawValue)
        }
    }
    
    #endif
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
