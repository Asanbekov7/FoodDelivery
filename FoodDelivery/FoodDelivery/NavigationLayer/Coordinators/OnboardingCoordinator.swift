//
//  OnboardingCoordinator.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
     showOnboarding()
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
        
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [OnboardingPartsViewController]()
        let firstVC = OnboardingPartsViewController()
        firstVC.imageToShow = .chickenLeg
        firstVC.labelText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.nextBtnText = "Next"
        
        let secondVC = OnboardingPartsViewController()
        secondVC.imageToShow = .shipped
        secondVC.labelText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.nextBtnText = "Next"
        
        let thirdVC = OnboardingPartsViewController()
        thirdVC.imageToShow = .medal
        thirdVC.labelText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.nextBtnText = "Next"
        
        let fourthVC = OnboardingPartsViewController()
        fourthVC.imageToShow = .creditCard
        fourthVC.labelText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.nextBtnText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
