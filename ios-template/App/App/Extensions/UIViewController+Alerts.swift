//
//  UIViewController+Alerts.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/18/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import Alamofire

extension UIViewController {
    func presentAlert(withMessage message: String, title: String? = nil, action: String = "Ok", completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: action, style: .default, handler: { (action) in
            completion?()
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    func presentError(withMessage message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: "Uh oh!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in
            completion?()
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    func present(error: Error, handler: ((UIAlertAction) -> Void)? = nil) {
        var message: String
        var title: String = "Uh oh!"
        if let error = error as? AFError {
            message = error.errorDescription ?? error.underlyingError?.localizedDescription ?? ""
        } else {
            message = error.localizedDescription
        }
        if message == "" {
            message = "Something went wrong."
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func presentUnavailable() {
        let alertController = UIAlertController(title: "😥", message: "This feature is currently unavailable.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}

