//
//  UIViewExtentions.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import Foundation

import UIKit

extension UIView {
    static func createView(_ view: UIView.Type) -> UIView {
        let shownView = view.init()
        return shownView
    }
}
