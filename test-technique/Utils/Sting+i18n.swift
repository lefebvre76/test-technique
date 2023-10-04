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
    
    func formatDate(originalFormat: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = originalFormat
        if let date = dateFormatter.date(from: self) {
            dateFormatter.locale = Locale.autoupdatingCurrent
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return self
    }
}
