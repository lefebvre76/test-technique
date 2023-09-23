//
//  String+removeHTML.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation

extension String {
    func removeHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
