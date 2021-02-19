//
//  ImageExtansions.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 18.02.2021.
//

import SwiftUI

extension Image {

    public init(fileName: String?) {
        guard let image = FilesManager.loadImage(name: fileName) else {
            self = Images.placeHolder
            return
        }
        self = image
    }
    
}
