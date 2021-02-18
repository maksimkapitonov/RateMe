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
        let mainButtonHeight: CGFloat = 50
        let mainButtonMaxWidth: CGFloat = 500
        let emptyViewMaxSize: CGFloat = 600
        let emptyViewCornerRadius: CGFloat = 24
    }
}

struct MyRatesView: View {
    
    // MARK: - Dependencies
    
    @ObservedObject var rateData: RateData

    // MARK: - Private properties
    
    @ObservedObject private var viewModel = MyRatesViewModel()
    @State private var showingAddItemView = false
    
    private var gridItemLayout = [
        GridItem(
            .adaptive(minimum: Constants().minGridSize, maximum: Constants().maxGridSize),
            spacing: Constants().gridSpacing
        )
    ]
    
    // MARK: - Init
    
    init(data: RateData) {
        rateData = data
    }
    
    // MARK: - Body
    
    var body: some View {
        bodyView
            .navigationTitle(Localizable.tabbarMyRates.rawValue)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(
                        Localizable.commonAdd.rawValue,
                        action: addRateItem
                    )
                }
            }
            .sheet(isPresented: $showingAddItemView) {
                AddRateView(data: rateData)
            }
    }
    
    // MARK: - Body properties
    
    private var bodyView: AnyView {
        if rateData.rateItems.isEmpty {
            return AnyView(emptyView)
        } else {
            return AnyView(itemsView)
        }
    }
    
    private var emptyView: some View {
        VStack {
            Spacer()
            
            Images.rateImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            Text(Localizable.myRatesAddFirst.rawValue)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Button(action: addRateItem) {
                Text(Localizable.commonAdd.rawValue)
                    .frame(height: Constants().mainButtonHeight)
                    .frame(maxWidth: Constants().mainButtonMaxWidth)
            }
            .buttonStyle(MainButtonStyle())
        }
        .frame(maxWidth: Constants().emptyViewMaxSize, maxHeight: Constants().emptyViewMaxSize)
        .background(Colors.additional)
        .cornerRadius(Constants().emptyViewCornerRadius)
        .padding()
    }
    
    private var itemsView: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(rateData.rateItems, id: \.self) {
                    RateCardView(rateItem: $0)
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func addRateItem() {
        showingAddItemView.toggle()
    }
}

struct MyRatesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRatesView(data: RateData())
    }
}
