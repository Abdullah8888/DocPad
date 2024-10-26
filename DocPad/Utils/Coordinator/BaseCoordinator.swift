//
//  BaseCoordinator.swift
//  DocPad
//
//  Created by Abdullah on 04/08/2024.
//

import Foundation
import UIKit

protocol Coordinator6 {
    func start()
}


enum Event {
    case buttonTapped1
    case buttonTapped2
}
protocol Coordinator5: AnyObject {
    var childCoordinators: [Coordinator5]? { get set }
    var navigationController: UINavigationController? { get set }
    func eventOccured(with type: Event)
    func start()
}
protocol Coordinating: AnyObject {
    var coordinator: Coordinator5? { get set }
}
extension Coordinator5 {

    

    func free(coordinator: Coordinator5) {
        //childCoordinators = childCoordinators.filter { $0 !== coordinator }
        for (index, item) in childCoordinators!.enumerated() {
            if item === coordinator {
                print("Removed coordinator: \(childCoordinators)")
                childCoordinators!.remove(at: index)
                print("Removed coordinator: \(childCoordinators)")
                break
            }
        }
    }
}

//protocol Coordinator: AnyObject, UINavigationControllerDelegate {
//    var childCoordinators: [Coordinator] { get set }
//    var navigationController: UINavigationController { get set }
//    func start()
//}

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var router: Router3? { get set }
    func start()
}

//protocol Coordinator: AnyObject {
//    var childCoordinators: [Coordinator] { get set }
//    var navigationController: UINavigationController { get set }
//    func start()
//}

protocol Coordinator3: AnyObject {
    var childCoordinators: [Coordinator3] { get set }
    func start()
}

extension Coordinator3 {

    func store(coordinator: Coordinator3) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator3?) {
        //childCoordinators = childCoordinators.filter { $0 !== coordinator }
        for (index, item) in childCoordinators.enumerated() {
            if item === coordinator {
                print("Removed coordinator: \(childCoordinators)")
                childCoordinators.remove(at: index)
                print("Removed coordinator: \(childCoordinators)")
                break
            }
        }
    }
    
    func printAllCoordinators() {
        print(childCoordinators)
    }
    
    
}
extension Coordinator {

    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator?) {
        //childCoordinators = childCoordinators.filter { $0 !== coordinator }
        
        for (index, item) in childCoordinators.enumerated() {
            if item === coordinator {
                print("Removed coordinator: \(childCoordinators)")
                childCoordinators.remove(at: index)
                print("Removed coordinator: \(childCoordinators)")
                break
            }
        }
    }
}





class BaseCoordinator3 : NSObject, Coordinator3, UINavigationControllerDelegate {
    //var navigationController: UINavigationController { get set}
    
    var childCoordinators : [Coordinator3] = []
    var isCompleted: (() -> ())?
    var aa: UIViewController?
    var bb: Coordinator3?
    func start() {
        
        fatalError("Children should implement `start`.")
        
    }
    

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
    
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        debugPrint("fromViewController1 is \(self)")
        debugPrint("fromViewController1 is \(Self.self)")
        debugPrint("fromViewController1 is \(navigationController.viewControllers)")
        debugPrint("fromViewController1 is \(fromViewController as? Coordinator3)")
        debugPrint("fromViewController2 is \(fromViewController as? HomeVC)")
        debugPrint("fromViewController3 is \(fromViewController as? HomeVC2)")
        debugPrint("fromViewController4 is \(fromViewController as? HomeVC3)")
        if let vc = fromViewController as? HomeVC2 {
            // We're popping a buy view controller; end its coordinator
            debugPrint("before is")
            printAllCoordinators()
            free(coordinator: vc.homeCoordinator2)
            debugPrint("after is")
            printAllCoordinators()
        }
//        if fromViewController === aa {
//            debugPrint("before is")
//            printAllCoordinators()
//            free(coordinator: bb)
//            debugPrint("after is")
//            printAllCoordinators()
//        }
    }
}

final class AppCoordinator3: BaseCoordinator3 {
    var window: UIWindow?
    var navigationController: UINavigationController
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    override func start() {
        window?.rootViewController = navigationController
        showHome()
    }
    
    func showHome() {
//        let router = Router2(navigationController: navigationController)
//        let homeCoordinator = HomeCoordinator(router: router)
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        store(coordinator: homeCoordinator)
        homeCoordinator.start()
    }
}

//class BaseCoordinator : Coordinator {
//    var navigationController: UINavigationController { get set}
//    
//    var childCoordinators : [Coordinator] = []
//    var isCompleted: (() -> ())?
//
//    func start() {
//        fatalError("Children should implement `start`.")
//    }
//    
//    func getRemainingVCs<T: UIViewController>(vcs: [UIViewController], stopVCAt: T.Type) -> [UIViewController]{
//        var newVCS = vcs
//        var index = newVCS.count-1
//        while index > 0 {
//            let vc = newVCS[index]
//            if !vc.isKind(of: stopVCAt.self) {
//                newVCS.remove(at: index)
//            }
//            else {
//                break
//            }
//            index = index - 1
//        }
//        return newVCS
//    }
//}
