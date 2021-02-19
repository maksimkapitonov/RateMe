//
//  RateCardView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 17.02.2021.
//

import SwiftUI

extension RateCardView {
    struct Constants {
        let itemTitleLineLimit = 2
        let padding10: CGFloat = 10
        let padding20: CGFloat = 20
        let cardCornerRadius: CGFloat = 12
        let cardMinHeight: CGFloat = 300
        let backgroundBrightness: Double = -0.15
        let backgroundBlurRadius: CGFloat = 3
    }
}

struct RateCardView: View {
    
    // MARK: - Dependencies
    
    var rateItem: RateItem
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                
                Text(rateItem.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .lineLimit(Constants().itemTitleLineLimit)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    
                    StarsView(rating: rateItem.rating)
                    
                    Spacer()
                }
                .padding([.bottom, .leading, .trailing], Constants().padding20)
                .padding(.top, Constants().padding10)
            }
        }
        .frame(minHeight: Constants().cardMinHeight)
        .background(background)
        .cornerRadius(Constants().cardCornerRadius)
        .padding(Constants().padding20)
    }
    
    // MARK: - Body properties
    
    private var background: some View {
        Image(fileName: rateItem.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .brightness(Constants().backgroundBrightness)
            .blur(radius: Constants().backgroundBlurRadius)
    }
    
}

struct RateCardView_Previews: PreviewProvider {
    static var previews: some View {
        RateCardView(rateItem: RateItem(id: UUID(), name: "123123", rating: 4, isFavourite: true, description: "123123123", createdAt: Date()))
    }
}
