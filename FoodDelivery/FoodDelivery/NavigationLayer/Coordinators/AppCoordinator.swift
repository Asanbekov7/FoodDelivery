//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        
        userStorage.passedOnboarding = false
        if userStorage.passedOnboarding {
            showMainFlow()
        } else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, navigation: navigationController, finishDelegate: self)
    }
    
    func showMainFlow() {
        guard let navigationController else { return }
        
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
}
