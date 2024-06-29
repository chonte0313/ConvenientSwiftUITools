// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
extension View{
    public func padding(vertical: CGFloat, horizontal: CGFloat)-> some View{
        return self.padding(.vertical, vertical).padding(.horizontal, horizontal)
    }
}
