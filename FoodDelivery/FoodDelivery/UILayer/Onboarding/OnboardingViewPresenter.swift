//
//  OnboardingViewPresenter.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter {
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
}

extension OnboardingViewPresenter: OnboardingViewOutput {
    func onboardingFinish() {
        coordinator.finish()
    }
    
    
}
