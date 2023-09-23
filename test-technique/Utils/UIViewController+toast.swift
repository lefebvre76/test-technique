//
//  UIViewController+toast.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation
import UIKit

extension UIViewController {

func showToast(message : String) {
    let toastLabel = UILabel(frame:
                                CGRect(x: 30,
                                       y: self.view.frame.size.height-100,
                                       width: self.view.frame.size.width - 60,
                                       height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 1.0, delay: 3.0, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
