//
//  HomeVC.swift
//  DocPad
//
//  Created by Abdullah on 05/08/2024.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    weak var homeCoordinator: HomeCoordinator?
    //weak var homeCoordinator11: HomeCoordinator11?
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
        
    }
    
    func setup() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonClicked() {
        // Action to be performed when the button is clicked
        print("Button was clicked! 1")
        homeCoordinator?.moveTo()
    }
    deinit {
        print("HomeVC is removed")
    }
}

class HomeVC2: UIViewController {
    weak var homeCoordinator2: HomeCoordinator2?
    //weak var homeCoordinator21: HomeCoordinator21?
    var onDeinit: (() -> Void)?
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setup()
    }
    func setup() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonClicked() {
        // Action to be performed when the button is clicked
        print("Button was clicked!2")
        homeCoordinator2?.moveToAnotherVC()
    }
    deinit {
        print("HomeVC2 is removed")
        self.homeCoordinator2 = nil
        //homeCoordinator2?.didEndCoordinator2()
        //onDeinit?()
    }
}

class HomeVC3: UIViewController {
    weak var homeCoordinator2: HomeCoordinator2?
    //weak var homeCoordinator21: HomeCoordinator21?
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setup()
//        self.trackDeallocation {
//            print("\(self) is being deallocated")
//        }
    }
    func setup() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonClicked() {
        // Action to be performed when the button is clicked
        print("Button was clicked!3")
        //homeCoordinator21?.didEndCoordinator()
        homeCoordinator2?.didEndCoordinator()
    }
    
    deinit {
        print("HomeVC3 is removed")
    }
}
