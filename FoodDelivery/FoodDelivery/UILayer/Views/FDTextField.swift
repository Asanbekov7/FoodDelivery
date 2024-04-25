//
//  FDTextField.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import UIKit

//MARK: - FDTextField

class FDTextField: UITextField {

    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout

private extension FDTextField {
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.grey
        self.font = .Roboto.Regular.size(of: 14)
        self.placeholder = "Text to input"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
