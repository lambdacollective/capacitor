//
//  BackButton.swift
//  ios-doctor
//
//  Created by Jun Ho Hong on 1/27/20.
//  Copyright © 2020 Jun Ho Hong. All rights reserved.
//

import Foundation

class BackButton: TouchableOpacityView {
    lazy var arrowView: UIImageView = self.createBackArrow()
    lazy var titleLabel: UILabel = self.createTitleLabel()
    
    let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.isUserInteractionEnabled = true
        titleLabel.text = title
        self.backgroundColor = Colors.clear
        layout()
    }
}

extension BackButton {
    func layout() {
        layoutArrow()
        layoutTitleLabel()
    }
    func layoutArrow() {
        self.addSubview(arrowView)
        arrowView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(10)
            make.height.equalTo(15)
        }
    }
    func layoutTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(arrowView.snp.right).offset(20)
            make.right.equalToSuperview()
        }
    }
}
extension BackButton {
    func createBackArrow() -> UIImageView {
        let view = UIImageView(image: UIImage(named: "backArrow"))
        view.contentMode = .scaleAspectFill
        return view
    }
    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = Colors.white
        label.font = Fonts.semiBold(14)
        return label
    }
}
