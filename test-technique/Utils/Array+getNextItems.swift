//
//  Array+getNextItems.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation

extension Array {
    func after(startIndex: Int, limit: Int) -> [Element] {
        var result: [Element] = []
        var currentIndex = startIndex
        for _ in 1...4 {
            if currentIndex < self.count {
                result.append(self[currentIndex])
                currentIndex += 1
            }
        }
        return result
    }
}
