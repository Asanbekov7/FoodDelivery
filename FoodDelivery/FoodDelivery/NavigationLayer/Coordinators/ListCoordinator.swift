//
//  ListCoordinator.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

class ListCoordinator: Coordinator {
    
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .gray
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
