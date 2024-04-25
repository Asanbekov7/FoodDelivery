//
//  OnboardingPartsViewController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

//MARK: - OnboardingPartsViewController

class OnboardingPartsViewController: UIViewController {
    
    //MARK: - Properties
    var imageToShow: UIImage? {
        didSet {
            titleImage.image = imageToShow
        }
    }
    
    var labelText: String? {
        didSet {
            titleLabel.text = labelText
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var nextBtnText: String?
    
    //MARK: - Views
    private lazy var titleImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .Roboto.Bold.size(of: 24)
        $0.textColor = AppColors.white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .Roboto.Regular.size(of: 14)
        $0.textColor = AppColors.white
        $0.numberOfLines = 0
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Layout

private extension OnboardingPartsViewController {
    func setupLayout() {
        [titleImage, titleLabel, descriptionLabel].forEach { view.addSubview($0) }
        
        setupTitleImage()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupTitleImage() {
        NSLayoutConstraint.activate([
            titleImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.heightAnchor.constraint(equalToConstant: 200),
            titleImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func setupDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
}
