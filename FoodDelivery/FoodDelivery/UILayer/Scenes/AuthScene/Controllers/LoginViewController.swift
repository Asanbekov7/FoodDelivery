//
//  LoginViewController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import UIKit

enum LoginViewState {
    case login
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

//MARK: - LoginViewController

class LoginViewController: UIViewController {

    
    //MARK: - Properties
    
    weak var viewOutput: LoginViewOutput!
    
    private var loginVCState: LoginViewState = .login
    
    //MARK: - Views
    private let bottomView = FDBottomView()
    private let fdTextField = FDTextField()
    
    private lazy var logoImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .imageToLogo
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    //MARK: - Init
    
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.loginVCState = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = AppColors.white
    }
}

//MARK: - Layout

private extension LoginViewController {
    func setupLayout() {
        switch loginVCState {
        case .login:
            setupBottomView()
            faceBookBtnAction()
            googleBtnAction()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
            //            setupFDTextField()
        case .signIn:
            setupBottomView()
            faceBookBtnAction()
            googleBtnAction()
            setupFDTextField()
        case .signUp:
            setupBottomView()
            faceBookBtnAction()
            googleBtnAction()
            setupFDTextField()
        }
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
    
    func setupFDTextField() {
        view.addSubview(fdTextField)
        fdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fdTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            fdTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.scheme = .tomato
        signInButton.setTitle("Sign in", .normal)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.scheme = .grey
        signUpButton.setTitle("Sign up", .normal)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
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

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}
