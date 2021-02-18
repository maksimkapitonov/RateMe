//
//  AddRateView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

extension AddRateView {
    struct Constants {
        let minRating = 1
        let maxRating = 5
        let textEditorHeight: CGFloat = 150
        let macOSPickerHeight: CGFloat = 150
        let iOSPickerHeight: CGFloat = 100
        let macOSBodyPadding: CGFloat = 30
        let macOSBodyMinWidth: CGFloat = 500
    }
}

struct AddRateView: View {
    
    // MARK: - Dependencies
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var data: RateData
    
    // MARK: - Private properties
    
    @ObservedObject private var viewModel = AddRateViewModel()
    private var ratings = Constants().minRating...Constants().maxRating
    
    // MARK: - Init
    
    init(data: RateData) {
        self.data = data
    }
    
    // MARK: - Body
    
    var body: some View {
        #if os(macOS)
        formView
        #else
        NavigationView {
            formView
        }
        #endif
    }
    
    // MARK: - Body properties
    
    private var formView: some View {
        Form() {
            Section(header: Text(Localizable.addRateItemName.rawValue)) {
                TextField("", text: $viewModel.newItem.name)
            }
            
            Section(header: Text(Localizable.addRateItemRating.rawValue)) {
                Picker("", selection: $viewModel.newItem.rating) {
                    ForEach(ratings, id: \.self) { rating in
                        StarsView(rating: rating)
                    }
                }
                .pickerStyle(pickerStyle)
                .frame(height: pickerHeight)
            }
            
            Section() {
                Toggle(
                    Localizable.addRateItemAddToFavourites.rawValue,
                    isOn: $viewModel.newItem.isFavourite
                )
            }
            
            Section(header: Text(Localizable.addRateItemDescription.rawValue)) {
                TextEditor(text: $viewModel.newItem.description)
                    .frame(height: Constants().textEditorHeight)
            }
        }
        .padding(bodyPadding)
        .frame(minWidth: bodyMinWidth)
        .navigationTitle(Localizable.addRateItemTitle.rawValue)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(
                    Localizable.commonSave.rawValue,
                    action: saveItem
                )
                .disabled(!viewModel.isValid)
            }
            #if os(macOS)
            ToolbarItem(placement: .cancellationAction) {
                Button(
                    Localizable.commonCancel.rawValue,
                    action: dismiss
                )
            }
            #endif
        }
    }
    
    private var pickerStyle: some PickerStyle {
        #if os(macOS)
        return InlinePickerStyle()
        #else
        return WheelPickerStyle()
        #endif
    }
    
    private var pickerHeight: CGFloat {
        #if os(macOS)
        return Constants().macOSPickerHeight
        #else
        return Constants().iOSPickerHeight
        #endif
    }
    
    private var bodyPadding: CGFloat {
        #if os(macOS)
        return Constants().macOSBodyPadding
        #else
        return 0
        #endif
    }
    
    private var bodyMinWidth: CGFloat? {
        #if os(macOS)
        return Constants().macOSBodyMinWidth
        #else
        return nil
        #endif
    }
    
    // MARK: - Private methods
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    private func saveItem() {
        presentationMode.wrappedValue.dismiss()
        data.rateItems.append(viewModel.newItem)
    }
    
}

struct AddRateView_Previews: PreviewProvider {
    static var previews: some View {
        AddRateView(data: RateData())
    }
}
