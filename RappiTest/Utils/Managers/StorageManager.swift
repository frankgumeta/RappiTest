//
//  StorageManager.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/13/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

final class StorageManager {
    enum LocalDirectory {
        case cache
        case downloads
    }
    
    class private func fileManager() -> FileManager {
        return FileManager.default
    }
    
    class private func urlPath(for directory: LocalDirectory) -> URL {
        var searchPathDirectory: FileManager.SearchPathDirectory
        
        switch directory {
        case .cache     : searchPathDirectory = .cachesDirectory
        case .downloads : searchPathDirectory = .downloadsDirectory
        }
        
        let paths = fileManager().urls(for: searchPathDirectory, in: .userDomainMask)
        return paths.first!
    }
    
    class func removeFile(atUrl url: URL) {
        try? fileManager().removeItem(at: url)
    }
    
    class func fileExist(atPath path: String) -> Bool {
        return fileManager().fileExists(atPath: path)
    }
    
}
// MARK: Images
extension StorageManager {
    class func deleteImage(url: String) {
        CacheHelper.shared.cache.removeObject(forKey: url as NSString)
    }
    
    class func saveImage(_ image: UIImage, withKey key: String) {
        CacheHelper.shared.cache.setObject(image, forKey: key as NSString)
    }
    
    class func fetchImage(fromURL urlString: String) -> UIImage? {
        let image = CacheHelper.shared.cache.object(forKey: urlString as NSString)
        return image
    }
}
//MARK: Entities
extension StorageManager {
    class func deleteEntity(fileName: String) {
        let url = urlPath(for: .cache).appendingPathComponent(fileName, isDirectory: false)
        removeFile(atUrl: url)
    }
    
    class func saveEntity<T: Encodable>(_ entity: T, as fileName: String) {
        let url = urlPath(for: .cache).appendingPathComponent(fileName, isDirectory: false)
        
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(entity) else {
            return
        }
        if fileExist(atPath: url.path) {
            removeFile(atUrl: url)
        }
        
        fileManager().createFile(atPath: url.path, contents: data, attributes: nil)
    }
    
    class func fetchEntity<T: Decodable>(_ fileName: String, as type: T.Type) -> T? {
        let url = urlPath(for: .cache).appendingPathComponent(fileName, isDirectory: false)
        
        guard fileExist(atPath: url.path) == true, let fileData = fileManager().contents(atPath: url.path) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        let model = try? decoder.decode(type, from: fileData)
        return model
    }
}

class CacheHelper {
    static let shared = CacheHelper()
    lazy var cache = NSCache<NSString, UIImage>()
    private init() {}
}
