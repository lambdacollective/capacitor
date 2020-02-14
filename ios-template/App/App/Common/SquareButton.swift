//
//  SquareButton.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation

enum SquareButtonType {
    case backArrow
    case settings
    case pause
    case close
    case profile
    case comments
    case camera
    case imageSelector
}
class SquareButton: TouchableOpacityView {
    let imageView = UIImageView()
    let type: SquareButtonType
    init(type: SquareButtonType) {
        self.type = type
        super.init(frame: .zero)
        layout()
        self.isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    func layout() {
        self.addSubview(imageView)
        switch type {
        case .backArrow:
            imageView.image = UIImage(named: "backArrow")
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(18)
                make.height.equalTo(15.5)
                make.center.equalToSuperview()
            }
        case .settings:
            imageView.image = UIImage(named: "settings")
            imageView.snp.makeConstraints { (make) in
                make.width.height.equalTo(25)
                make.center.equalToSuperview()
            }
        case .pause:
            imageView.image = UIImage(named: "pause")
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(19)
                make.height.equalTo(20)
                make.center.equalToSuperview()
            }
        case .close:
            imageView.image = UIImage(named: "close")
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(15)
                make.height.equalTo(15)
                make.center.equalToSuperview()
            }
        case .profile:
            imageView.image = UIImage(named: "profile")
            imageView.snp.makeConstraints { (make) in
                make.width.height.equalTo(25)
                make.center.equalToSuperview()
            }
        case .comments:
            imageView.image = UIImage(named: "comments")
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(47/2)
                make.height.equalTo(38/2)
                make.center.equalToSuperview()
            }
        case .camera:
            imageView.image = UIImage(named: "camera")
            imageView.snp.makeConstraints { (make) in
                make.width.height.equalTo(25)
                make.center.equalToSuperview()
            }
        case .imageSelector:
            imageView.image = UIImage(named: "imageSelector")
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(77/2)
                make.height.equalTo(68/2)
                make.center.equalToSuperview()
            }
        imageView.contentMode = .scaleAspectFit
        }
    }
}
