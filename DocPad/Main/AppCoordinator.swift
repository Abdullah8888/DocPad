//
//  AppCoordinator.swift
//  DocPad
//
//  Created by Abdullah on 04/08/2024.
//

import Foundation
import UIKit

//final class AppCoordinator: BaseCoordinator {
//    let navigationController: UINavigationController
//    let window: UIWindow
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//
//}

//final class AppFlowCoordinator: BaseCoordinator {
//  
//    let window: UIWindow
//    var appDIContainer: AppDIContainer
//    var userDefault: UserDefaultManagerDelegate
//    lazy var navigationController = UINavigationController()
//    
//    init(window: UIWindow, appDIContainer: AppDIContainer, userDefault: UserDefaultManagerDelegate) {
//        self.window = window
//        self.appDIContainer = appDIContainer
//        self.userDefault = userDefault
//    }
//
//    override func start() {
//        if userDefault.hasUserSignIn {
//            showHome()
//        }
//        else {
//            window.rootViewController = navigationController
//            showOnboarding(navigationController: navigationController)
//        }
//        window.makeKeyAndVisible()
//    }
//    
//    func showOnboarding(navigationController: UINavigationController) {
//        let onboardingSceneDIContainer = appDIContainer.makeOnboardingSceneDIContainer()
//        let onboardingFlow = onboardingSceneDIContainer.makeOnboardingFlowCoordinator(navigationController: navigationController)
//        onboardingFlow.userDefault = userDefault
//        store(coordinator: onboardingFlow)
//        onboardingFlow.start()
//        onboardingFlow.isCompleted = { [weak self] in
//            self?.free(coordinator: onboardingFlow)
//        }
//    }
//    
//    func showHome() {
//        let rootViewController = UITabBarController()
//        window.rootViewController = rootViewController
//        let tabCoordinator = TabCoordinator(tabBarController: rootViewController)
//        tabCoordinator.userDefault = userDefault
//        store(coordinator: tabCoordinator)
//        tabCoordinator.start()
//    }
//    
//    func showChatLog(userId: String) {
//        let chatFlowCoordinator = ChatFlowCoordinator.init(navigationController: navigationController, chatSceneDIContainer: appDIContainer.makeChatSceneDIContainer())
//    
//        let realManager = appDIContainer.makeRealmManager()
//        if let remoteContact = realManager.realm.object(ofType: RemoteContact.self, forPrimaryKey: userId) {
//            store(coordinator: chatFlowCoordinator)
//            chatFlowCoordinator.showChatLog(remoteContact: remoteContact)
//            chatFlowCoordinator.isCompleted = { [weak self] in
//                self?.free(coordinator: chatFlowCoordinator)
//            }
//        }
//    }
//    
//    deinit {
//        print("AppFlowCoordinator is now deallocated")
//    }
//}
//

//class BaseCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
//    var childCoordinators: [Coordinator] = []
//    
//    var navigationController: UINavigationController
//    
//    init(navigationController: UINavigationController) {
//        
//        self.navigationController = navigationController
//    }
//    
//    //var childCoordinators : [Coordinator3] = []
//    var isCompleted: (() -> ())?
//
//    func start() {
//        
//        fatalError("Children should implement `start`.")
//        
//    }
//    
//    
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//
//        if let buyViewController = fromViewController as? CreateAccVC1 {
//            // We're popping a buy view controller; end its coordinator
//            print("lololo \(navigationController.viewControllers.last)")
//            free(coordinator: buyViewController.createAccCoordinator)
//        }
//    }
//}

//class AppCoordinator: BaseCoordinator {
//    var window: UIWindow?
//
//    init(navigationController: UINavigationController, window: UIWindow) {
//        super.init( navigationController: navigationController)
//        self.window = window
//    }
//
//
//    override func start() {
//        //self.asddfdf()
//        window?.rootViewController = navigationController
//        showHome2()
//    }
//
//
//    func showHome2() {
//        //navigationController.delegate = self
//        //let router = Router2(navigationController: navigationController)
//        let buyCoordinator = BuyCoordinator(navigationController: navigationController)
//        //buyCoordinator.parentCoordinator = self
//        //childCoordinators.append(buyCoordinator)
//        store(coordinator: buyCoordinator)
//        buyCoordinator.start()
//    }
//
//
//    deinit {
//        print("AppCoordinator is removed")
//    }
//}


// working
//class AppCoordinator: NSObject, Coordinator {
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//
//    var window: UIWindow?
//
//    init(navigationController: UINavigationController, window: UIWindow) {
//        self.navigationController = navigationController
//        self.window = window
//    }
//
//
//    func start() {
//        window?.rootViewController = navigationController
//        showHome2()
//    }
//
//
//    func showHome2() {
//        //navigationController.delegate = self
//        //let router = Router2(navigationController: navigationController)
//        let buyCoordinator = BuyCoordinator(navigationController: navigationController)
//        //buyCoordinator.parentCoordinator = self
//        //childCoordinators.append(buyCoordinator)
//        store(coordinator: buyCoordinator)
//        buyCoordinator.start()
//    }
//
//    deinit {
//        print("AppCoordinator is removed")
//    }
//}

class AppCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var router: Router3?

    var window: UIWindow?

    init(router: Router3?, window: UIWindow) {
        self.router = router
        self.window = window
    }

    func start() {
        window?.rootViewController = router?.navigationController
        showHome2()
    }


    func showHome2() {
        //navigationController.delegate = self

        let buyCoordinator = BuyCoordinator(router: router)
        //buyCoordinator.parentCoordinator = self
        //childCoordinators.append(buyCoordinator)
        store(coordinator: buyCoordinator)
        buyCoordinator.start()
    }

   

    deinit {
        print("AppCoordinator is removed")
    }
}


class BuyCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    weak var router: Router3?
    
    weak var parentCoordinator: AppCoordinator?
    init(router: Router3?) {
        self.router = router
    }

    func start() {

        let vc = BuyVC()
        vc.buyCoordinator = self

        router?.navigationController.setViewControllers([vc], animated: false)

    }

    func moveTo() {
        let createAccCoordinator = CreateAccCoordinator(router: router)
        //createAccCoordinator.parentCoordinator = self
        store(coordinator: createAccCoordinator)
        createAccCoordinator.start()
        router?.isCompleted = { [weak self] in
            self?.router?.firstVCInCoordinator = nil
            self?.free(coordinator: createAccCoordinator)
            self?.router = nil
            self = nil
        }
    }
    
    deinit {
        print("BuyCoordinator is removed")
    }

}


//class BuyCoordinator: BaseCoordinator {
//
//    weak var parentCoordinator: AppCoordinator?
//    override init(navigationController: UINavigationController) {
//         super.init(navigationController: navigationController)
//    }
//
//    override func start() {
//        navigationController.delegate = self
//        let vc = BuyVC()
//        vc.buyCoordinator = self
//        navigationController.setViewControllers([vc], animated: true)
//    }
//
//    func moveTo() {
//        let createAccCoordinator = CreateAccCoordinator(navigationController: navigationController)
//        //createAccCoordinator.parentCoordinator = self
//        store(coordinator: createAccCoordinator)
//        createAccCoordinator.start()
//    }
//
//
//    deinit {
//        print("BuyCoordinator is removed")
//    }
//}

//Working
//class BuyCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//    weak var parentCoordinator: AppCoordinator?
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        navigationController.delegate = self
//        let vc = BuyVC()
//        vc.buyCoordinator = self
//        navigationController.setViewControllers([vc], animated: false)
//    }
//
//    func moveTo() {
//        let createAccCoordinator = CreateAccCoordinator(navigationController: navigationController)
//        //createAccCoordinator.parentCoordinator = self
//        store(coordinator: createAccCoordinator)
//        createAccCoordinator.start()
//    }
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//
//        if let buyViewController = fromViewController as? CreateAccVC1 {
//            // We're popping a buy view controller; end its coordinator
//            print("lololo \(navigationController.viewControllers.last)")
//            free(coordinator: buyViewController.createAccCoordinator)
//        }
//    }
//    deinit {
//        print("BuyCoordinator is removed")
//    }
//}

class CreateAccCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var router: Router3?
    
    //weak var parentCoordinator: BuyCoordinator?
    init(router: Router3?) {
        self.router = router
    }

    func start() {

        let vc = CreateAccVC1()
        vc.createAccCoordinator = self
        
        router?.firstVCInCoordinator = vc
        router?.navigationController.pushViewController(vc, animated: true)
    }

    func moveTo() {
        //navigationController.delegate = self
        let vc = CreateAccVC2()
        vc.createAccCoordinator = self
        router?.navigationController.pushViewController(vc, animated: true)
    }

    deinit {
        print("CreateAccCoordinator is removed")
    }
}


//class CreateAccCoordinator: BaseCoordinator {
//
//    weak var parentCoordinator: BuyCoordinator?
//    override init(navigationController: UINavigationController) {
//        super.init(navigationController: navigationController)
//    }
//
//    override func start() {
//
//        let vc = CreateAccVC1()
//        vc.createAccCoordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
//
//    func moveTo() {
//        //navigationController.delegate = self
//        let vc = CreateAccVC2()
//        vc.createAccCoordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
//
//    deinit {
//        print("CreateAccCoordinator is removed")
//    }
//}


//Working
//class CreateAccCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//    weak var parentCoordinator: BuyCoordinator?
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//
//        let vc = CreateAccVC1()
//        vc.createAccCoordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
//
//    func moveTo() {
//        //navigationController.delegate = self
//        let vc = CreateAccVC2()
//        vc.createAccCoordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
//
//    deinit {
//        print("CreateAccCoordinator is removed")
//    }
//}


class AppCoordinator5: NSObject, Coordinator5, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator5]? = []
    
    var navigationController: UINavigationController?
    let window: UIWindow?
    init(navigationController: UINavigationController? = nil, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func eventOccured(with type: Event) {
        switch type {
            
        case .buttonTapped1:
            print("sd")
//            let vc: (UIViewController & Coordinating) = TestVC2()
//            vc.coordinator = self
//            navigationController?.pushViewController(vc, animated: true)
        case .buttonTapped2:
            print("asdff")
//            let vc: (UIViewController & Coordinating) = TestVC3()
//            vc.coordinator = self
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        window?.rootViewController = navigationController
        navigationController?.delegate = self
        showHome()
    }
    
    func showHome() {
//        let vc: (UIViewController & Coordinating) = TestVC1()
//        vc.coordinator = self
//        navigationController?.setViewControllers([vc], animated: true)
        let asd = TestCoordinator()
        asd.navigationController = navigationController
        childCoordinators?.append(asd)
        asd.start()
    }
    
//    func showHome2() {
//        let vc: (UIViewController & Coordinating) = TestVC2()
//        vc.coordinator = self
//        navigationController?.setViewControllers([vc], animated: true)
//    }
//
//    func showHome3() {
//        let vc: (UIViewController & Coordinating) = TestVC3()
//        vc.coordinator = self
//        navigationController?.setViewControllers([vc], animated: true)
//    }
    
    deinit {
        print("AppCoordinator5 is removed")
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let buyViewController = fromViewController as? TestVC3 {
            // We're popping a buy view controller; end its coordinator
            free(coordinator: buyViewController.coordinator!)
        }
    }
}


class TestCoordinator: Coordinator5 {
    var childCoordinators: [Coordinator5]? = nil
    
    var navigationController: UINavigationController?
    
    
    func eventOccured(with type: Event) {
        switch type {
            
        case .buttonTapped1:
            let vc: (UIViewController & Coordinating) = TestVC2()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .buttonTapped2:
            let vc: (UIViewController & Coordinating) = TestVC3()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        let vc: (UIViewController & Coordinating) = TestVC1()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    
    
    func showHome2() {
        let vc: (UIViewController & Coordinating) = TestVC2()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    func showHome3() {
        let vc: (UIViewController & Coordinating) = TestVC3()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    deinit {
        print("TestCoordinator is removed")
    }
}
