//
//  UIViewController+Alert.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayAlert(with message: String?) {
        let alertViewController = UIAlertController(title: "Erreur",
                                                    message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .cancel,
                                     handler: nil)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true)
    }
}
