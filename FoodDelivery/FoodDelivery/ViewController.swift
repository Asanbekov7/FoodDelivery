//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 23/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var lab: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .Roboto.BoldItalic.size(of: 25)
//        $0.textColor = .black
        $0.text = "Hello world!"
        
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstr()
    }


    func setConstr() {
        view.addSubview(lab)
        NSLayoutConstraint.activate([
            lab.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            lab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            lab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            lab.heightAnchor.constraint(equalToConstant: 30)
        
        ])
    }
}

