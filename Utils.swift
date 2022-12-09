
import SwiftUI
import AppKit
import Cocoa

extension String {
    func fuzzyMatch(_ needle: String) -> [String.Index]? {
        var ixs: [Index] = []
        if needle.isEmpty { return [] }
        let lower = CharacterSet.lowercaseLetters
        let allLower = needle.unicodeScalars.allSatisfy({ lower.contains($0) })
        var remainder = needle[...].utf8
        let utf8 = (allLower ? self.lowercased() : self).utf8
        for idx in utf8.indices {
            let char = utf8[idx]
            if char == remainder[remainder.startIndex] {
                ixs.append(idx)
                remainder.removeFirst()
                if remainder.isEmpty { return ixs }
            }
        }
        return nil
    }
}

extension FileHandle : TextOutputStream {
  public func write(_ string: String) {
    guard let data = string.data(using: .utf8) else { return }
    self.write(data)
  }
}

typealias Match = (string: String, indices: [String.Index])

func fuzzyMatch(_ items: [String], by needle: String) -> [Match] {
    items.compactMap {
        guard let match = $0.fuzzyMatch(needle) else { return nil }
        return ($0, match)
    }
}

extension NSColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("0x") && hex.count == 8 {
            // let start = hexString.index(after: hexString.startIndex)
            // let hexColor = hexString.substring(from: start)

            let scanner = Scanner(string: hex)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
                // a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: 1.0)
                return
            }
        }
        return nil
    }
}

// Increment
prefix operator ++

prefix func ++(x: inout Int) -> Int {
    x += 1
    return x
}

extension NSTableView {
    open override var acceptsFirstResponder: Bool {
        get { false }
    }
    // open override var becomeFirstResponder: Bool {
    //     get { false }
    // }
    open override var canBecomeKeyView: Bool {
        get { false }
    }
}