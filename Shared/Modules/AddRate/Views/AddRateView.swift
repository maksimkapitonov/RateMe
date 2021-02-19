//
//  AddRateView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import SwiftUI

extension AddRateView {
    struct Constants {
        let ratingRange = 1...5
        let textEditorHeight: CGFloat = 150
        let macOSPickerHeight: CGFloat = 150
        let iOSPickerHeight: CGFloat = 100
        let macOSBodyPadding: CGFloat = 30
        let macOSBodyMinWidth: CGFloat = 500
        let imageViewCornerRadius: CGFloat = 12
    }
}

struct AddRateView: View {
    
    // MARK: - Dependencies
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var data: RateData
    
    // MARK: - Private properties
    
    @ObservedObject private var viewModel = AddRateViewModel()
    #if os(macOS)
    @State private var inputImage: NSImage?
    #else
    @State private var inputImage: UIImage?
    #endif
    
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
                    ForEach(Constants().ratingRange, id: \.self) { rating in
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
            
            Section(header: Text(Localizable.addRateItemImage.rawValue)) {
                itemImage
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
        .sheet(isPresented: $viewModel.showingImagePicker, onDismiss: checkImage) {
            #if os(macOS)
            #else
            ImagePicker(image: self.$inputImage)
            #endif
        }
    }
    
    private var itemImage: AnyView {
        if viewModel.selectedImage == nil {
            return AnyView(addImageView)
        } else {
            #if os(macOS)
            return AnyView(
                HStack {
                    Button(action: selectImage) {
                        Text(Localizable.addRateItemChangeImage.rawValue)
                    }
                    Text(Localizable.addRateItemImageLoaded.rawValue)
                        .foregroundColor(.green)
                }
            )
            #else
            return AnyView(selectedImageView)
            #endif
        }
    }
    
    private var addImageView: some View {
        Button(action: selectImage) {
            Text(Localizable.addRateItemLoadImage.rawValue)
        }
    }
    
    private var selectedImageView: some View {
        Image(fileName: viewModel.newItem.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .cornerRadius(Constants().imageViewCornerRadius)
            .padding()
            .onTapGesture(perform: selectImage)
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
        data.rateItems.append(viewModel.newItem)
        presentationMode.wrappedValue.dismiss()
    }
    
    private func selectImage() {
        #if os(macOS)
        
        NSOpenPanel.openImage { result in
            guard case let .success(image) = result else { return }
            inputImage = image
            checkImage()
        }
        
        #else
        
        viewModel.showingImagePicker = true
        
        #endif
    }
    
    private func checkImage() {
        #if os(macOS)
        
        guard let image = inputImage else { return }
        let imageName = "\(UUID())"
        viewModel.newItem.image = imageName
        FilesManager.save(image: image, name: imageName)
        viewModel.selectedImage = Image(fileName: viewModel.newItem.image)
        
        #else
        
        guard let image = inputImage else { return }
        let imageName = "\(UUID())"
        viewModel.newItem.image = imageName
        FilesManager.save(image: image, name: imageName)
        viewModel.selectedImage = Image(fileName: viewModel.newItem.image)

        #endif
    }
    
}

struct AddRateView_Previews: PreviewProvider {
    static var previews: some View {
        AddRateView(data: RateData())
    }
}
