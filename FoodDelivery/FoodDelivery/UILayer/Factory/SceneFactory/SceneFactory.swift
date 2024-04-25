//
//  SceneFactory.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import Foundation
import UIKit

struct SceneFactory {
    
    //MARK: - Onboarding flow
    
    static func makeOnboardingFlow(coordinator: AppCoordinator, navigation: UINavigationController, finishDelegate: CoordinatorFinishDelegate) {
        let onboardingCoordinator =  OnboardingCoordinator(type: .onboarding, navigationController: navigation, finishDelegate: finishDelegate)
        coordinator.addCildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
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
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        return viewController
    }
}

//MARK: - Main flow

extension SceneFactory {
    
    static func makeMainFlow(coordinator: AppCoordinator ,finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "house.fill"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "house.fill"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "house.fill"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addCildCoordinator(homeCoordinator)
        coordinator.addCildCoordinator(orderCoordinator)
        coordinator.addCildCoordinator(listCoordinator)
        coordinator.addCildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
}
