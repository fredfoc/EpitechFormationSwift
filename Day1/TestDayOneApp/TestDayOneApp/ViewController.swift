//
//  ViewController.swift
//  TestDayOneApp
//
//  Created by fauquette fred on 22/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        if let destinationViewController = destinationViewController as? ModalViewController {
            destinationViewController.textLabel = "Hello world"
            destinationViewController.originalViewController = self
        }
    }
}

extension ViewController: ModalViewControllerDelegate {
    func dismissWasCalled() {
        print("dismiss was called")
    }
}

