//
//  UIImageView+load.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation
import UIKit

extension UIImageView {
    func load(string: String) {
        if let url = URL(string: string) {
            self.load(url: url)
        }
    }

    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
