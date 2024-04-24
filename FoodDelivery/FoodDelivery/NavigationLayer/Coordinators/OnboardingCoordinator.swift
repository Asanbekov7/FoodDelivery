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
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .gray
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .cyan
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .brown
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
