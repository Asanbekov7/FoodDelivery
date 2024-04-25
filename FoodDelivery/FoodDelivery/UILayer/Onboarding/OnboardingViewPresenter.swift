//
//  OnboardingViewPresenter.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

//MARK: - OnboardingViewOutput

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

//MARK: - OnboardingViewPresenter

class OnboardingViewPresenter {
    weak var coordinator: OnboardingCoordinator!
    
    private let userStorage = UserStorage.shared
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
}

extension OnboardingViewPresenter: OnboardingViewOutput {
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
