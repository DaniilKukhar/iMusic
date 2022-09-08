//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Danya Kukhar on 16.08.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(rgb: 0xFF0060)
        
        setupTrackDetailView()
        
        let searchVC: SearchViewController = SearchViewController.loadFromSoryboard()
        
        viewControllers = [
            generateViewController(rootViewController: searchVC, image: UIImage(named: "search")!, title: "Search"),
            generateViewController(rootViewController: ViewController(), image: UIImage(named: "library")!, title: "Library")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
    
    private func setupTrackDetailView() {
        print("Here we are setup TrackDetailView")
        
        let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
        view.addSubview(trackDetailView)
    }
}
