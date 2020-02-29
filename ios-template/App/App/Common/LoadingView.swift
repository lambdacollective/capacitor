//
//  LoadingView.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import Lottie

enum LoadingViewStyle {
    case large
    case medium
    case tiny
}

class LoadingView: UIView {
    lazy var animationView: AnimationView = {
        if traitCollection.userInterfaceStyle == .dark {
            return AnimationView(name: "darkmodeloading")
        } else {
            return AnimationView(name: "lightmodeloading")
        }
    }()
    let style: LoadingViewStyle
    let offset: CGPoint
    var isLoading: Bool {
        return animationView.isAnimationPlaying
    }
    init(style: LoadingViewStyle = .large, offset: CGPoint = CGPoint.zero) {
        self.style = style
        self.offset = offset
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        if traitCollection.userInterfaceStyle == .dark {
            backgroundColor = Colors.black
        } else {
            backgroundColor = Colors.white
        }
//        backgroundColor = Colors.white
        addSubview(animationView)
        let width: CGFloat
        let height: CGFloat
        switch style {
        case .large:
            width = 500
            height = 250
        case .medium:
            width = 35
            height = 17.5
        case .tiny:
            width = 25
            height = 12.5
        }
        animationView.snp.makeConstraints {(make) in
            make.centerX.equalToSuperview().offset(offset.x)
            make.centerY.equalToSuperview().offset(offset.y)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
    }
    
    func show() {
        self.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 1
        })
        animationView.play {(_) in
            
        }
        animationView.loopMode = .loop
    }
    
    func hide() {
        self.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0
        })
        animationView.stop()
    }
}
