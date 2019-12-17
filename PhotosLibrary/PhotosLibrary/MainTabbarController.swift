//
//  MainTabbarController.swift
//  PhotosLibrary
//
//  Created by Olga Melnik on 17.12.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC =  PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        
        
        viewControllers = [generateNavigationController(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "photos")),generateNavigationController(rootViewController: ViewController(), title: "Favourites", image: #imageLiteral(resourceName: "heart")),generateNavigationController(rootViewController: CollectionViewController(collectionViewLayout: UICollectionViewLayout()), title: "Temp", image: #imageLiteral(resourceName: "heart"))]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
