/*
 
 erica sadun ericasadun.com
 Math Types
 Swift2
 
 */

import Foundation
import QuartzCore

// MARK: Conversion

/// Numbers that can be represented as Double instances
public protocol DoubleRepresentable {
    var doubleValue: Double { get }
}

/// Numbers that convert to other types
public protocol ConvertibleNumberType: DoubleRepresentable {
    var floatValue: Float { get }
    var intValue: Int { get }
    var cgFloatValue: CGFloat { get }
}

// Default conversion implementations
public extension ConvertibleNumberType {
    public var floatValue: Float { get { return Float(doubleValue) } }
    public var intValue: Int { get { return lrint(doubleValue) } }
    public var cgFloatValue: CGFloat { get { return CGFloat(doubleValue) } }
}

// Conform to ConvertibleNumberType
extension Double: ConvertibleNumberType {
    public var doubleValue: Double { return self }
}

// Conform to ConvertibleNumberType
extension Int: ConvertibleNumberType {
    public var doubleValue: Double { return Double(self) }
}

// Conform to ConvertibleNumberType
extension CGFloat: ConvertibleNumberType {
    public var doubleValue: Double { return Double(self) }
}

// Conform to ConvertibleNumberType
extension Float: ConvertibleNumberType {
    public var doubleValue: Double { return Double(self) }
}

public extension ConvertibleNumberType {
    public func toPrecision(digits: Int) -> String {
        if digits == 0 {
            return "\(lrint(self.doubleValue))"
        }
        
        let prefix = String(Int(self.doubleValue)) + "."
        var suffix = self.doubleValue - Int(self.doubleValue).doubleValue
        
        if suffix == 0 {
            return prefix + String(repeating: "0", count: digits)
        }
        
        for _ in 0 ..< digits { suffix *= 10 }
        return prefix + String(lrint(suffix))
    }
}

extension Int {
    func stringFrontPadded(to count: Int) -> String {
        var string = String(self)
        while string.count < count { string = "0" + string }
        return string
    }
}
