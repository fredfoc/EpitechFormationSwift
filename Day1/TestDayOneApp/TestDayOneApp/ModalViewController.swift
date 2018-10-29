//
//  ModalViewController.swift
//  TestDayOneApp
//
//  Created by fauquette fred on 22/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate: class {
    func dismissWasCalled()
}

class ModalViewController: UIViewController {
    var textLabel: String?
    weak var originalViewController: ModalViewControllerDelegate?
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func dismiss(_ sender: Any) {
        //originalViewController doit réaliser une action
        originalViewController?.dismissWasCalled()
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = textLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
