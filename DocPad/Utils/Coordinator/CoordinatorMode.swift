//
//  nnnnn.swift
//  DocPad
//
//  Created by Abdullah on 04/08/2024.
//

import Foundation
import UIKit

public enum CoordinatorMode {
    case push
    case present(presentingViewController: UIViewController, configuration: CoordinatorModePresentConfiguration?)
    case embed(parentViewController: UIViewController, containerView: UIView?)
}

public struct CoordinatorModePresentConfiguration {
    let modalPresentationStyle: UIModalPresentationStyle
    let transitioningDelegate: UIViewControllerTransitioningDelegate?
}
