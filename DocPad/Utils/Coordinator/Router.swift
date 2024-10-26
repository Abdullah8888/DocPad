//
//  Router.swift
//  DocPad
//
//  Created by Abdullah on 06/08/2024.
//

import Foundation
import UIKit

protocol Drawable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Drawable {
    var viewController: UIViewController? { return self }
}

typealias NavigationBackClosure = (() -> ())

protocol RouterProtocol: AnyObject {
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigateBack: NavigationBackClosure?)
    func pop(_ isAnimated: Bool)
    func popToRoot(_ isAnimated: Bool)
}

class Router : NSObject, RouterProtocol {
    
    

    let navigationController: UINavigationController
    private var closures: [String: NavigationBackClosure] = [:]

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func push(_ drawable: Drawable, isAnimated: Bool, onNavigateBack closure: NavigationBackClosure?) {
        guard let viewController = drawable.viewController else {
            return
        }

        if let closure = closure {
            closures.updateValue(closure, forKey: viewController.description)
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }

    private func executeClosure(_ viewController: UIViewController) {
        guard let closure = closures.removeValue(forKey: viewController.description) else { return }
        closure()
    }
    func pop(_ isAnimated: Bool) {
        
    }
    
    func popToRoot(_ isAnimated: Bool) {
        
    }
}

extension Router : UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(previousController) else {
                return
        }
        executeClosure(previousController)
    }
}

final class Router2 : NSObject, UINavigationControllerDelegate {

    let navigationController: UINavigationController
    var firstVCInCoordinator: UIViewController?
    var isCompleted: (() -> ())?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
    
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        debugPrint("cn1 is \(self)")
        debugPrint("cn1 is \(Self.self)")
        debugPrint("cn1 is \(navigationController.viewControllers)")
        debugPrint("cn1 is \(fromViewController as? Coordinator3)")
        debugPrint("cn2 is \(fromViewController as? HomeVC)")
        debugPrint("cn3 is \(fromViewController as? HomeVC2)")
        debugPrint("cn4 is \(fromViewController as? HomeVC3)")
        
        if self.firstVCInCoordinator == fromViewController {
//            self?.free(coordinator: vc.homeCoordinator2!)
            self.isCompleted?()

        }
        
    }

}

final class Router3 : NSObject, UINavigationControllerDelegate {

    let navigationController: UINavigationController
    weak var firstVCInCoordinator: UIViewController?
    var isCompleted: (() -> ())?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
    
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        debugPrint("cn1 is \(self)")
        debugPrint("cn1 is \(Self.self)")
        debugPrint("cn1 is \(navigationController.viewControllers)")
        debugPrint("cn1 is \(fromViewController as? Coordinator3)")
        debugPrint("cn2 is \(fromViewController as? HomeVC)")
        debugPrint("cn3 is \(fromViewController as? HomeVC2)")
        debugPrint("cn4 is \(fromViewController as? HomeVC3)")
        
        if self.firstVCInCoordinator == fromViewController {
//            self?.free(coordinator: vc.homeCoordinator2!)
            self.isCompleted?()

        }
        
    }

}


