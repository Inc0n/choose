

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


// https://stackoverflow.com/questions/59813943/swiftui-remove-focus-ring-highlight-border-from-macos-textfield
// Disable focus ring
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

extension String {
    func fuzzy(_ needle: String) -> Bool {
        if self.count > needle.count { return false }
        else if self == needle { return true }

        var searchIdx = self.startIndex
        var needleIdx = needle.startIndex

        while searchIdx != self.endIndex {
            if needleIdx == needle.endIndex {
                return false
            }
            if self[searchIdx] == needle[needleIdx] {
                searchIdx = self.index(after: searchIdx)
            }
            needleIdx = needle.index(after: needleIdx)
        }
        return true
    }
}

extension NSColor {

    func toHexString() -> String {
        guard let rgbColor = usingColorSpace(NSColorSpace.deviceRGB)
        else {
            return "FFFFFF"
        }
        let red = Int(round(rgbColor.redComponent * 0xFF))
        let grn = Int(round(rgbColor.greenComponent * 0xFF))
        let blu = Int(round(rgbColor.blueComponent * 0xFF))
        let hexString = NSString(format: "#%02X%02X%02X", red, grn, blu)
        return hexString as String
    }
}