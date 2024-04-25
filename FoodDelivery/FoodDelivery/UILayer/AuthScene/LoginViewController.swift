//
//  LoginViewController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import UIKit

//MARK: - LoginViewController

class LoginViewController: UIViewController {

    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
   
}

//MARK: - Layout

private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
        faceBookBtnAction()
        googleBtnAction()
    }
 
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    //MARK: - Actions
    
    func faceBookBtnAction() {
        bottomView.facebookAction = { sender in
            //To DO
            print("facebookAction")
        }
    }
    
    func googleBtnAction() {
        bottomView.googleAction = {  sender in
            //To DO
            print("googleAction")
        }
    }
}
