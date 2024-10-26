//
//  HomeCoordinator.swift
//  DocPad
//
//  Created by Abdullah on 05/08/2024.
//

import Foundation
import UIKit

final class HomeCoordinator: BaseCoordinator3 {
    var navigationController: UINavigationController
    //var router: Router2?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
//    init(router: Router2?) {
//        self.router = router
//    }
    
    override func start() {
        let vc = HomeVC()
        vc.homeCoordinator = self
        //router.navigationController.delegate = self
        navigationController.delegate = self
        //router?.navigationController.setViewControllers([vc], animated: true)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func moveTo() {
        let homeCoordinator2 = HomeCoordinator2(navigationController: navigationController)
        //let homeCoordinator2 = HomeCoordinator2(router: router)
        
        store(coordinator: homeCoordinator2)
        homeCoordinator2.start()
//        homeCoordinator2.isCompleted = {[weak self] in
//            self?.printAllCoordinators()
//            self?.free(coordinator: homeCoordinator2)
//            self?.printAllCoordinators()
//            print("finish")
//        }
//        self.router?.isCompleted = { [weak self] in
//            self?.router?.firstVCInCoordinator = nil
//            self?.free(coordinator: homeCoordinator2)
//        }
    }
    deinit {
        print("HomeC1 is removed")
    }
}

final class HomeCoordinator2: BaseCoordinator3 {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
//    weak var router: Router2?
//    init(router: Router2?) {
//        self.router = router
//
//    }
    
    override func start() {
        let vc = HomeVC2()
        vc.homeCoordinator2 = self
//        aa = vc
//        bb = self
        navigationController.pushViewController(vc, animated: true)
        //navigationController.delegate = self
//        router?.firstVCInCoordinator = vc
//        router?.navigationController.pushViewController(vc, animated: true)
        
    }
    
    func moveToAnotherVC() {
        let vc = HomeVC3()
        vc.homeCoordinator2 = self
        navigationController.pushViewController(vc, animated: true)
        //router?.navigationController.pushViewController(vc, animated: true)
    }
    
    func didEndCoordinator() {
//        print("lala is \(router.navigationController.viewControllers)")
//        router.navigationController.popToRootViewController(animated: true)
//        isCompleted?()
    }
    
    func didEndCoordinator2() {
//        print("lala is \(router.navigationController.viewControllers)")
//        //navigationController.popToRootViewController(animated: true)
//        isCompleted?()
    }
    
    deinit {
        print("HomeC2 is removed")
    }
}


