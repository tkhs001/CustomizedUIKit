//
//  CustomizedProgressView.swift
//  CustomizedUIKit
//
//  Created by Naoyuki TAKAHASHI on 2021/03/24.
//

import UIKit

class CustomizedProgressView: UIView {

    private var backgroundView: UIView!
    private var foregroundView: UIView!
    private var foregroundViewWidthConstraint: NSLayoutConstraint!
    
    private lazy var configureLayout: (() -> Void)? = {
        backgroundView.backgroundColor = .lightGray
        foregroundView.backgroundColor = .systemBlue
        
        backgroundView.layer.cornerRadius = bounds.height / 2
        foregroundView.layer.cornerRadius = bounds.height / 2
        
        backgroundView.clipsToBounds = true
        foregroundView.clipsToBounds = true

        return nil
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    private func initialize() {

        self.backgroundView = UIView()
        self.foregroundView = UIView()

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        foregroundView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(backgroundView)
        addSubview(foregroundView)

        self.foregroundViewWidthConstraint = foregroundView.widthAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foregroundView.topAnchor.constraint(equalTo: topAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foregroundViewWidthConstraint,
        ])

    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayout?()
    }
    
    func updateProgress(percentage: Float) {
        foregroundViewWidthConstraint.constant = floor(bounds.width * CGFloat(percentage))
        layoutIfNeeded()
    }

}
