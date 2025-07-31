//
//  FileService.swift
//  ApplicationBundle1
//
//  Created by Sona Hunanyan on 25.07.25.
//

import Foundation

class FileService {
    static private func defaultDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    static func save(content: String, fileName: String) throws {
        guard let deafultPath = defaultDirectory() else {
            throw FileError.fileNotFound
        }
        let path = deafultPath.appendingPathComponent(fileName)
        
        do {
            try content.write(to: path, atomically: true, encoding: .utf8)
        } catch {
            throw FileError.failToSave
        }
    }
    
    static func read(fileName: String) throws -> String {
        guard let defaultPath = defaultDirectory() else {
            throw FileError.fileNotFound
        }
        let path = defaultPath.appendingPathComponent(fileName)
        
        do {
            return try String(contentsOf: path, encoding: .utf8)
        }
        catch {
            throw FileError.failToRead
        }
    }
    
    static func append(content: String, fileName: String) throws {
        guard let defaultPath = defaultDirectory() else {
            throw FileError.fileNotFound
        }
        let path = defaultPath.appendingPathComponent(fileName)
        guard let data = (content).data(using: .utf8) else {
            throw FileError.failToSave
        }
        do {
            if let fileHandle = try? FileHandle(forWritingTo: path) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            } else {
                throw FileError.failToSave
            }
        } catch {
            throw FileError.failToSave
        }
    }
}

enum FileError: Error {
    case  failToSave
    case  failToRead
    case fileNotFound
    
}
