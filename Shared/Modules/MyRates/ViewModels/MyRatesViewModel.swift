//
//  MyRatesViewModel.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 16.02.2021.
//

import Foundation
import Combine

final class MyRatesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var rateItems: RateItems = [
        RateItem(id: UUID(), name: "1111111", rating: 5, isFavourite: true, description: "fjkhkjfahv fvhafklhvafhv flvhfkslhvkafhvkdfjhvd vdaflhvlkfdhgvdfklgvlhdfav fdlhvdflhvghjfdvg adfjhlv dfhvgfdhjvghdfj gvljdfhvhdf gvhjdfg hjvgdfjhvgdfvgdfgv dfgvdf gvhkadfg hvd fghvgdfhkv kdfhvdf vhdfkjvhjdf vdafv  dfaav dfvfv fd fv fv  fv fdvjdfuovhdf;kvhkdfvh dfkv"),
        RateItem(id: UUID(), name: "2222222", rating: 5, isFavourite: false, description: "dusvhkjdvhjkasv;k \nfgdfgdfdfdsf \nefgewgfgw \negeqfgefqgfeqg"),
        RateItem(id: UUID(), name: "3333333", rating: 2, isFavourite: true, description: ""),
        RateItem(id: UUID(), name: "4444444", rating: 3, isFavourite: true, description: ""),
        RateItem(id: UUID(), name: "5555555", rating: 1, isFavourite: false, description: ""),
        RateItem(id: UUID(), name: "6666666", rating: 4, isFavourite: false, description: ""),
        RateItem(id: UUID(), name: "7777777", rating: 5, isFavourite: true, description: ""),
    ]
    
}
