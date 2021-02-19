//
//  NSOpenPanelExtensions.swift
//  RateMe (macOS)
//
//  Created by Maksim Kapitonov on 19.02.2021.
//

import SwiftUI

extension NSOpenPanel {
  enum ImageError: Error {
    case selectionFailed
  }

  static func openImage(completion: @escaping (_ result: Result<NSImage, Error>) -> Void) {
    let panel = NSOpenPanel()
    panel.allowsMultipleSelection = false
    panel.canChooseFiles = true
    panel.canChooseDirectories = false
    panel.allowedFileTypes = ["jpg", "jpeg", "png", "heic"]
    panel.begin { result in
      guard
        result == .OK,
        let url = panel.urls.first,
        let image = NSImage(contentsOf: url)
      else {
        completion(.failure(ImageError.selectionFailed))
        return
      }
      completion(.success(image))
    }
  }
}
