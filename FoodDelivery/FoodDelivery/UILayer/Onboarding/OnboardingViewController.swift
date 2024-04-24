//
//  OnboardingViewController.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 24/4/24.
//

import UIKit

//MARK: - OnboardingViewController

class OnboardingViewController: UIViewController {

    //MARK: - Properties
    
    private var pages = [OnboardingPartsViewController]()
    var viewOutput: OnboardingViewOutput!
    
    //MARK: - Views
    
    private lazy var pageVC: UIPageViewController = {
        $0.delegate = self
        $0.dataSource = self
        $0.setViewControllers([pages.first!], direction: .forward, animated: true)
        $0.view.backgroundColor = AppColors.accentTomato
        return $0
    }(UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal))
    
    private lazy var pageControl: UIPageControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfPages = pages.count
        $0.currentPage = 0
        
        return $0
    }(UIPageControl())
    
    private lazy var nextButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .Roboto.Bold.size(of: 18)
        $0.setTitleColor(AppColors.black, for: .normal)
        $0.backgroundColor = AppColors.white
        $0.layer.cornerRadius = 24
        $0.addAction(nextBtnAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    init(pages: [OnboardingPartsViewController] = [OnboardingPartsViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.accentTomato
        setupLayout()
    }
    
    //MARK: - Actions
    
    private lazy var nextBtnAction = UIAction { [weak self] _ in
        guard let self else { return }
        
        switch pageControl.currentPage {
        case 0:
            self.pageControl.currentPage = 1
            self.pageVC.setViewControllers([self.pages[1]], direction: .forward, animated: true)
        case 1:
            pageControl.currentPage = 2
            self.pageVC.setViewControllers([self.pages[2]], direction: .forward, animated: true)
        case 2:
            pageControl.currentPage = 3
            self.pageVC.setViewControllers([self.pages[3]], direction: .forward, animated: true)
            self.nextButton.setTitle(self.pages[3].nextBtnText, for: .normal)
        case 3:
            print("Exit!")
        default:
            break
        }
    }
}

//MARK: - Layout

private extension OnboardingViewController {
    func setupLayout() {
        setupPageVC()
        setupPageControl()
        setupNextButton()
    }
    
    func setupPageVC() {
        addChild(pageVC)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
    }
    
    func setupPageControl() {
        
        let page = pages[0]
        let title = page.nextBtnText
        nextButton.setTitle(title, for: .normal)
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        
        ])
    }
    
    func setupNextButton() {
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -44),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartsViewController), currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartsViewController), currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
    }
    
    
}

//MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartsViewController) {
            let page = pages[index]
            let title = page.nextBtnText
            nextButton.setTitle(title, for: .normal)
            pageControl.currentPage = index
        }
    }
}
