//
//  FDButton.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import UIKit

//MARK: - Scheme enum

enum FDButtonScheme {
    case white
    case tomato
    case grey
}

//MARK: - FDButton

class FDButton: UIView {
    
    //MARK: - Properties
    var scheme: FDButtonScheme = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    var customButtonAction: ((UIAction) -> Void)?

    //MARK: - Views
    private lazy var customButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .Roboto.Bold.size(of: 18)
        $0.layer.cornerRadius = 24
        $0.addAction(customBtnAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    //MARK: - Init
    init(scheme: FDButtonScheme = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customBtnAction = UIAction { [weak self] sender in
        guard let self else { return }
        self.customButtonAction?(sender)
    }
    
    func setTitle(_ title: String?, _ buttonState: UIButton.State) {
        customButton.setTitle(title, for: buttonState)
    }
    
}

//MARK: - Private methods

private extension FDButton {
    func setupLayout() {
        setupFDButton()
    }
    
    func setupFDButton() {
        self.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: topAnchor),
            customButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            customButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            customButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setColorScheme(scheme: FDButtonScheme) {
        
        switch scheme {
        case .white:
            customButton.backgroundColor = AppColors.white
            customButton.setTitleColor(AppColors.black, for: .normal)
        case .tomato:
            customButton.backgroundColor = AppColors.accentTomato
            customButton.setTitleColor(AppColors.white, for: .normal)
        case .grey:
            customButton.backgroundColor = AppColors.grey
            customButton.setTitleColor(AppColors.black, for: .normal)
        }
    }
}
