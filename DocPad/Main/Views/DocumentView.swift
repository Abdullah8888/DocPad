//
//  DocumentView.swift
//  DocPad
//
//  Created by Abdullah on 04/08/2024.
//

import Foundation
import UIKit

class DocumentView: UIView {
    
    private let drawButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Signature", for: .normal)
        button.addTarget(nil, action: #selector(drawButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let exportButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Export Signature", for: .normal)
        button.addTarget(nil, action: #selector(exportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let addTextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Text", for: .normal)
        button.addTarget(nil, action: #selector(addTextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func drawButtonTapped() {
        // Present the drawing view controller
//        let drawViewController = DrawViewController()
//        drawViewController.delegate = self
//        drawViewController.modalTransitionStyle = .coverVertical
//        drawViewController.modalPresentationStyle = .fullScreen
//        present(drawViewController, animated: true, completion: nil)
    }
    
    @objc private func exportButtonTapped() {
        //saveDocumentWithSignature()
    }
    
    @objc private func addTextButtonTapped() {
//         let textField = DraggableTextField(frame: CGRect(x: 20, y: 160, width: 150, height: 60))
//        pdfView.addSubview(textField)
    }
    
    
}
