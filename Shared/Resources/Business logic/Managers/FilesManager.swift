//
//  FilesManager.swift
//  RateMe
//
//  Created by Maksim Kapitonov on 18.02.2021.
//

import SwiftUI

struct FilesManager {
    
    // MARK: - Save
    
    static func save(rateItems items: RateItems) {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        let documentsDirectoryPath = paths.first
        
        if let jsonData = try? JSONEncoder().encode(items),
           let path = documentsDirectoryPath?.appendingPathComponent("rateItems") {
            try? jsonData.write(to: path)
        }
    }
    
    static func save(image: UIImage, name: String) {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        let documentsDirectoryPath = paths.first
        
        if let jpgData = image.jpegData(compressionQuality: 0.5),
           let path = documentsDirectoryPath?.appendingPathComponent(name) {
            try? jpgData.write(to: path)
        }
    }
    
    // MARK: - Load

    static func loadImage(name: String?) -> Image? {
        guard let fileName = name else {
            return nil
        }
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        if let documentsDirectory = paths.first {
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            if let image = UIImage(contentsOfFile: imageUrl.path) {
                return Image(uiImage: image)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    static func loadRateItems() -> RateItems? {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        if let documentsDirectory = paths.first {
            let dataUrl = documentsDirectory.appendingPathComponent("rateItems")
            if let decodedItems = try? JSONDecoder().decode(RateItems.self, from: Data(contentsOf: dataUrl)) {
                return decodedItems
            }
        }
        return nil
    }
    
}
