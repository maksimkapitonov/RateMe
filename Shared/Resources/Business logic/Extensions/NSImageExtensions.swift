//
//  NSImageExtensions.swift
//  RateMe (macOS)
//
//  Created by Maksim Kapitonov on 19.02.2021.
//

import Cocoa

extension NSImage {
    var png: Data? { tiffRepresentation?.bitmap?.png }
}
