//
//  DataExtensions_macOS.swift
//  RateMe (macOS)
//
//  Created by Maksim Kapitonov on 19.02.2021.
//

import Cocoa

extension Data {
    var bitmap: NSBitmapImageRep? { NSBitmapImageRep(data: self) }
}
