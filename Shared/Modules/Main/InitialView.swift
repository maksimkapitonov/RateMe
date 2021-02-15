//
//  InitialView.swift
//  Shared
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        #if os(iOS)
        TabbarView()
        #else
        SidebarView()
        #endif
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
