//
//  DesignKit.swift
//  DesignKit
//
//  Created by 핏투비 on 2022/12/22.
//
import UIKit

public protocol  DesignKit {
    func buildRedView() -> UIView
    func buildView(themeColor: ThemeColor) -> UIView
}

public enum ThemeColor {
    case bgColor1
    case bgColor2
    
    var color: UIColor {
        switch self {
        case .bgColor1: return .systemIndigo
        case .bgColor2: return .systemCyan
            
        }
    }
}

public class DesignKitImp: DesignKit {
    
    public init() {}
    public func buildRedView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    public func buildView(themeColor: ThemeColor) -> UIView {
        let view = UIView()
        view.backgroundColor = themeColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
