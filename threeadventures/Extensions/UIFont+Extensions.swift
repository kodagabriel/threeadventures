//
//  UIFont+CustomFonts.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

extension UIFont {
    static func marcellusFont(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "MarcellusSC-Regular", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
}
