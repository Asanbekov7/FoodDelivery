//
//  OnboardingCoordinator.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
       let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

