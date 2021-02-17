//
//  MyRatesView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 16.02.2021.
//

import SwiftUI

extension MyRatesView {
    struct Constants {
        let minGridSize: CGFloat = 250
        let maxGridSize: CGFloat = 500
        let gridSpacing: CGFloat = 20
    }
}

struct MyRatesView: View {
    
    // MARK: - Private properties
    
    @ObservedObject private var viewModel = MyRatesViewModel()
    @State private var showingAddItemView = false
    
    private var gridItemLayout = [
        GridItem(
            .adaptive(minimum: Constants().minGridSize, maximum: Constants().maxGridSize),
            spacing: Constants().gridSpacing
        )
    ]
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(viewModel.rateItems, id: \.self) {
                    RateCardView(rateItem: $0)
                }
            }
        }
        
        .navigationTitle(Localizable.tabbarMyRates.rawValue)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                #if os(macOS)
                Button(
                    Localizable.commonAdd.rawValue,
                    action: addRateItem
                )
                #else
                NavigationLink(
                    Localizable.commonAdd.rawValue,
                    destination: AddRateView()
                )
                #endif
            }
        }
        .sheet(
            isPresented: $showingAddItemView) {
            AddRateView()
        }
    }
    
    // MARK: - Private methods
    
    private func addRateItem() {
        showingAddItemView.toggle()
    }
}

struct MyRatesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRatesView()
    }
}
