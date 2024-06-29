//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
extension View{
    func roundedBorder(_ num: CGFloat, lineWidth: CGFloat, color: Color) -> some View{
        return self.overlay(
            RoundedRectangle(cornerRadius: num).stroke(style: StrokeStyle(lineWidth: lineWidth)).foregroundColor(color)
        )
    }
}

@available(iOS 14.0, macOS 11.0, *)
extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

@available(iOS 14.0, macOS 11.0, *)
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


@available(iOS 14.0, macOS 11.0, *)
struct SafeAreaInsetsKey: EnvironmentKey {
    public static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}


@available(iOS 14.0, macOS 11.0, *)
extension EnvironmentValues {
    
    public var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}


@available(iOS 14.0, macOS 11.0, *)
extension UIEdgeInsets {
    
    public var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
