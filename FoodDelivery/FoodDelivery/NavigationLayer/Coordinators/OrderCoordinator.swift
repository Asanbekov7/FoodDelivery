//
//  OrderCoordinator.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
