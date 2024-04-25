//
//  BottomView.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import UIKit

//MARK: - BottomView

class FDBottomView: UIView {
    
    //MARK: - Properties
    
    var facebookAction: ((UIAction) -> Void)?
    
    var googleAction: ((UIAction) -> Void)?
    
    //MARK: - Views
    private lazy var lineView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = AppColors.bottomViewGrey.withAlphaComponent(0.3)
        return $0
    }(UIView())

    private lazy var connectLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = AppColors.bottomViewGrey
        $0.text = "Or connect with"
        $0.font = .Roboto.Regular.size(of: 14)
        return $0
    }(UILabel())
    
    private lazy var foodImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .foodImageBV
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var faceBookButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.facebook, for: .normal)
        $0.layer.cornerRadius = 20
        $0.addAction(facbookBtnAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var googleButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.googlePlus, for: .normal)
        $0.layer.cornerRadius = 20
        $0.addAction(googleBtnAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 20
        $0.distribution = .equalSpacing
        $0.addArrangedSubview(faceBookButton)
        $0.addArrangedSubview(googleButton)
        return $0
    }(UIStackView())
    
    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    private lazy var facbookBtnAction = UIAction { [weak self] sender in
        guard let self else { return }
        
        self.facebookAction?(sender)
    }
    
    private lazy var googleBtnAction = UIAction { [weak self] sender in
        guard let self else { return }
        
        self.googleAction?(sender)
    }
}

//MARK: - Private Methods

private extension FDBottomView {
    func setupLayout() {
        self.backgroundColor = AppColors.white
        [lineView, connectLabel, hStack, foodImageView].forEach { self.addSubview($0) }
        setupConnectLabel()
        setupLineView()
        
        setupFoodImageView()
        setupFaceBookButton()
        setupGoogleButton()
        setupHStack()
    }
    
    func setupLineView() {
        NSLayoutConstraint.activate([
            lineView.centerYAnchor.constraint(equalTo: connectLabel.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: connectLabel.leadingAnchor, constant: -12),
            lineView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    func setupConnectLabel() {
        NSLayoutConstraint.activate([
            connectLabel.topAnchor.constraint(equalTo: topAnchor),
            connectLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    func setupFoodImageView() {
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 12),
            foodImageView.heightAnchor.constraint(equalToConstant: 150),
            foodImageView.widthAnchor.constraint(equalToConstant: 282),
            foodImageView.trailingAnchor.constraint(equalTo: hStack.leadingAnchor, constant: -10)
        
        ])
    }
    
    func setupFaceBookButton() {
        NSLayoutConstraint.activate([
            faceBookButton.heightAnchor.constraint(equalToConstant: 40),
            faceBookButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupGoogleButton() {
        NSLayoutConstraint.activate([
            googleButton.heightAnchor.constraint(equalToConstant: 40),
            googleButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupHStack() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: connectLabel.bottomAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
}
