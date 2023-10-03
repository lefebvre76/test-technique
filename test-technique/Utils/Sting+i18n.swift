//
//  Sting+i18n.swift
//  test-technique
//
//  Created by Loïc Levebvre on 03/10/2023.
//

import Foundation

extension String {
    func localized(arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments)
    }
}
