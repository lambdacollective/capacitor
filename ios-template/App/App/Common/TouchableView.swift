//
//  TouchableView.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import UIKit

protocol TouchableView {
    var tapGesture: UITapGestureRecognizer? { get set }
    var selectBlock: (() -> Void)? { get set }
}

class TouchableNonOpacityView: UIView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
}

class TouchableOpacityView: UIView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}

class TouchableBounceView: UIView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.9
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

class TouchableOpacityImageView: UIImageView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}

class TouchableNonOpacityImageView: UIImageView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}

class TouchableBounceImageView: UIImageView, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.8
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

class TouchableOpacityCollectionViewCell: UICollectionViewCell, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}
class TouchableOpacityTableViewCell: UITableViewCell, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}
class TouchableBounceCollectionViewCell: UICollectionViewCell, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var bounceView: UIView?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.bounceView?.alpha = 0.9
            self.bounceView?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.bounceView?.alpha = 1
            self.bounceView?.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.22, delay: 0, options: [.allowUserInteraction], animations: {
            self.bounceView?.alpha = 1
            self.bounceView?.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

class TouchableOpacityLabel: UILabel, TouchableView {
    var tapGesture: UITapGestureRecognizer?
    var selectBlock: (() -> Void)? {
        didSet {
            guard self.tapGesture == nil else { return }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressed))
            self.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        }
    }
    
    @objc func pressed() {
        self.selectBlock?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.allowUserInteraction], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}
