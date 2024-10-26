//
//  TestVC.swift
//  DocPad
//
//  Created by Abdullah on 07/08/2024.
//

import Foundation
import UIKit

final class BuyVC: UIViewController {
    weak var buyCoordinator: BuyCoordinator?
    
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
        buyCoordinator?.moveTo()
    }
    deinit {
        print("BuyVC is removed")
    }
}

final class CreateAccVC1: UIViewController {
    weak var createAccCoordinator: CreateAccCoordinator?
    
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
        createAccCoordinator?.moveTo()
    }
    deinit {
        print("CreateAccVC1 is removed")
    }
}

final class CreateAccVC2: UIViewController {
    weak var createAccCoordinator: CreateAccCoordinator?
    
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
       
    }
    deinit {
        print("CreateAccVC2 is removed")
    }
}


final class TestVC1: UIViewController, Coordinating {
    var coordinator: Coordinator5?
    
    
    
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
        coordinator?.eventOccured(with: .buttonTapped1)
    }
    deinit {
        print("TestVC1 is removed")
    }
}

final class TestVC2: UIViewController, Coordinating {
    var coordinator: Coordinator5?
    
    //weak var buyCoordinator: BuyCoordinator?
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click MMe", for: .normal)
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
        coordinator?.eventOccured(with: .buttonTapped2)
    }
    deinit {
        print("TestVC2 is removed")
    }
}

final class TestVC3: UIViewController, Coordinating {
    var coordinator: Coordinator5?
    
    //weak var buyCoordinator: BuyCoordinator?
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click MMe", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
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
       
    }
    deinit {
        print("TestVC3 is removed")
    }
}
