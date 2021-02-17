//
//  AddRateViewModel.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 16.02.2021.
//

import Foundation
import Combine

final class AddRateViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var newItem = RateItem(
        id: UUID(),
        name: "",
        rating: 3,
        isFavourite: false,
        description: ""
    )
    
    // MARK: - Methods
    
    var isValid: Bool {
        return !newItem.name.isEmpty
    }
    
}
