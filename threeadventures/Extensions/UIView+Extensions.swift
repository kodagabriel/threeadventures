//
//  UIView+Extensions.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
