//
//  ImageCacheService.swift
//  ApplicationBundle2
//
//  Created by Sona Hunanyan on 26.07.25.
//

import Foundation
import UIKit

class ImageCacheService {
    static let instance = ImageCacheService()
    private let tempDirectory = FileManager.default.temporaryDirectory
    
    private func memoryNotificationListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(clearCache), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }
    
    private init() {
        memoryNotificationListener()
    }
    
    
    @objc func clearCache() {
        do {
            let data = try FileManager.default.contentsOfDirectory(at: tempDirectory, includingPropertiesForKeys: nil)
            for d in data {
                try FileManager.default.removeItem(at: d)
            }
        } catch {
            print(error)
        }
    }
    
    func loadCachedImages() -> [URL] {
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: tempDirectory, includingPropertiesForKeys: nil)
            return fileURLs
        } catch {
            print(error)
            return []
        }
    }
    
    func cacheImages(images: [URL], completion: (() -> Void)? = nil) {
        let group = DispatchGroup()
        for url in images {
            group.enter()
            URLSession.shared.dataTask(with: url) { data, _, error in
                defer { group.leave() }

                guard let data = data, error == nil else {
                    return
                }

                let filePath = self.tempDirectory.appendingPathComponent(url.lastPathComponent)
                try? data.write(to: filePath)
            }.resume()
        }
        group.notify(queue: .main) {
            completion?()
        }
    }

}
