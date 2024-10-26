//
//  AppCoor.swift
//  DocPad
//
//  Created by Abdullah on 08/08/2024.
//

import Foundation
import UIKit

class AppCoordinator6: Coordinator6 {
    let window: UIWindow
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, window: UIWindow) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        window.rootViewController = navigationController
        let carCoordinator = CarCoordinator(navigationController: navigationController)
        carCoordinator.start()
        
       // window.makeKeyAndVisible()
    }
    
    deinit {
        print("\(self) is removed")
    }
}

class CarCoordinator: Coordinator6 {
    private let navigationController: UINavigationController
    var vc: CarVC?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
         vc = CarVC()
        vc?.carCoordinator = self
        navigationController.setViewControllers([vc!], animated: true)
    }
    
    func moveTo() {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
        detailsCoordinator.start()
    }
    
    deinit {
        print("\(self) is removed")
    }
}

class DetailsCoordinator: Coordinator6 {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = DetailVC1()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveTo() {
        let vc = DetailVC2()
        navigationController.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("\(self) is removed")
    }
}
