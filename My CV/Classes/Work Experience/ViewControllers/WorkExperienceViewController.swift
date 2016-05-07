//
//  WorkExperienceViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class WorkExperienceViewController: UIViewController {
    
    var pageViewController: UIPageViewController!

    let examples = StubDataProvider().getWorkExamples()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        title = "WORK EXPERIENCE"
    }
    
    private func setupPageController() {
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.view.frame = view.bounds
        pageViewController.dataSource = self
        
        let firstController = storyboard?.instantiateViewControllerWithIdentifier("WorkExampleViewController") as! WorkExampleViewController
        firstController.example = examples[0]
        firstController.index = 0
        
        pageViewController.setViewControllers([firstController], direction: .Forward, animated: true, completion: nil)
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
}

extension WorkExperienceViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? WorkExampleViewController)?.index else { return nil }
        return viewControllerForIndex(index + 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? WorkExampleViewController)?.index else { return nil }
        return viewControllerForIndex(index - 1)
    }
    
    func viewControllerForIndex(index: Int) -> UIViewController? {
        guard index >= 0 && index < examples.count else { return nil }
        
        let viewController = storyboard?.instantiateViewControllerWithIdentifier("WorkExampleViewController") as! WorkExampleViewController
        viewController.example = examples[index]
        viewController.index = index
        
        return viewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return examples.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}