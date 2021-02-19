//
//  NSBitmapImageRepExtensions_macOS.swift
//  RateMe (macOS)
//
//  Created by Maksim Kapitonov on 19.02.2021.
//

import Cocoa

extension NSBitmapImageRep {
    var png: Data? { representation(using: .png, properties: [:]) }
}
