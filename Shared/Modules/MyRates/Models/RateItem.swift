//
//  RateItem.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 15.02.2021.
//

import Foundation

typealias RateItems = [RateItem]

struct RateItem: Codable, Hashable {
    
    let id: UUID
    var name: String
    var rating: Int
    var isFavourite: Bool
    var description: String
    var image: String?
    let createdAt: Date
    
}
