//
//  TabBarController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = AppColors.background
        self.tabBar.tintColor = AppColors.accentTomato
    }
}
