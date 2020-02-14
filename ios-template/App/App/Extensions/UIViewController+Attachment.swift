//
//  UIViewController+Attachment.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import SnapKit

extension UIViewController {
    func attachToViewController(parentVC: UIViewController, toBack: Bool = true, fullSize: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        parentVC.view.addSubview(view)
        parentVC.addChild(self)
        didMove(toParent: parentVC)
        if fullSize {
            view.snp.makeConstraints { (make) in
                make.top.bottom.left.right.equalToSuperview()
            }
        }
        if toBack {
            parentVC.view.sendSubviewToBack(view)
        }
    }
}
