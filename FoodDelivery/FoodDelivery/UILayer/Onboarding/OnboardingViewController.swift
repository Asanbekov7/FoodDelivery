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
    
    private var pages = [UIViewController]()
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
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
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
    
}

//MARK: - Layout

private extension OnboardingViewController {
    func setupLayout() {
        setupPageVC()
        setupPageControl()
    }
    
    func setupPageVC() {
        addChild(pageVC)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
    }
    
    func setupPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        
        ])
    }
}

//MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
    }
    
    
}

//MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
