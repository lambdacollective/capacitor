//
//  ActionButton.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: TouchableBounceView {
   
    lazy var titleLabel: UILabel = self.createTitleLabel()
    lazy var activityIndicator: UIActivityIndicatorView = self.createActivityIndicator()
    
    var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2, animations: {
                    self.backgroundColor = Colors.black
                })
                self.isUserInteractionEnabled = true
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.backgroundColor = Colors.white.withAlphaComponent(0.5)
                })
                self.isUserInteractionEnabled = false
            }
        }
    }
    
    var isLoading: Bool {
        didSet {
            if isLoading {
                titleLabel.alpha = 0
                activityIndicator.startAnimating()
                self.isUserInteractionEnabled = false
            } else {
                titleLabel.alpha = 1
                activityIndicator.stopAnimating()
                self.isUserInteractionEnabled = true
            }
        }
    }
    
    var onPress: (() -> Void)?
    
    init(title: String, onPress: (() -> Void)? = nil) {
        self.title = title
        self.isEnabled = true
        self.onPress = onPress
        self.isLoading = false
        super.init(frame: CGRect.zero)
        setup()
    }
    
    func setup() {
        self.isUserInteractionEnabled = true
        titleLabel.text = title
        if isEnabled {
            self.backgroundColor = Colors.black
            self.isUserInteractionEnabled = true
        } else {
            self.backgroundColor = Colors.black.withAlphaComponent(0.5)
            self.isUserInteractionEnabled = false
        }
        layout()
    }
   
    
    func setTitle(_ title: String, animated: Bool = true) {
        if animated {
            UIView.transition(with: titleLabel,
                              duration: 0.15,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.titleLabel.text = title
                }, completion: nil)
        } else {
            self.titleLabel.text = title
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension ActionButton {
    
    func layout() {
        self.backgroundColor = Colors(hex: 0x32509E)
        layer.cornerRadius = 4
        layoutTitle()
        layoutActivityIndicator()
    }
    func layoutTitle() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {(make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
    }
    func layoutActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {(make) in
            make.centerY.centerX.equalToSuperview()
        }
    }
}

extension ActionButton {
    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.semiBold(17)
        label.textColor = Colors.white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    func createActivityIndicator() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .gray)
        return view
    }
}
