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
    }
}

struct RateCardView: View {
    
    var rateItem: RateItem
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                
                Text(rateItem.name)
                    .font(.largeTitle)
                    .lineLimit(Constants().itemTitleLineLimit)
                
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
        .background(Color.secondary)
        .cornerRadius(Constants().cardCornerRadius)
        .padding(Constants().padding20)
    }
    
}

struct RateCardView_Previews: PreviewProvider {
    static var previews: some View {
        RateCardView(rateItem: RateItem(id: UUID(), name: "123123", rating: 4, isFavourite: true, description: "123123123"))
    }
}
