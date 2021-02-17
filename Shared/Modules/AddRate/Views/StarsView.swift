//
//  StarsView.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 16.02.2021.
//

import SwiftUI

struct StarsView: View {
    
    // MARK: - Internal properties
    
    var rating: Int
    
    // MARK: - Private properties
    
    private let maxRating = 5
    private let offColor = Color.gray
    private let onColor = Color.yellow
    
    // MARK: - Body

    var body: some View {
        HStack {
            ForEach(1 ..< maxRating + 1) { number in
                Image(systemName: Icons.star)
                    .foregroundColor(starColor(number: number))
            }
        }
    }
    
    // MARK: - Body properties
    
    private func starColor(number: Int) -> Color {
        number > rating ? self.offColor : self.onColor
    }
    
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(rating: 4)
    }
}
