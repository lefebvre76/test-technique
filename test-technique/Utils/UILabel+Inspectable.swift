//
//  UILabel+i18n.swift
//  test-technique
//
//  Created by Loïc Levebvre on 03/10/2023.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable var localizableText: String? {
        get { return text }
        set(value) {
            text = value?.localized()
        }
    }
    
    @IBInspectable public var uppercased: Bool {
        get { return false }
        set(value) {
            if value {
                text = text?.uppercased()
            }
        }
    }
}
