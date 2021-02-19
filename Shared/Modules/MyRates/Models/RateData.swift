//
//  RateData.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 17.02.2021.
//

import Foundation
import Combine

final class RateData: ObservableObject {
    
    @Published var rateItems: RateItems = FilesManager.loadRateItems() ?? [] {
        didSet {
            FilesManager.save(rateItems: rateItems)
        }
    }
    
}
