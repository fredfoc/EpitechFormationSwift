//
//  DetailViewController.swift
//  TableViewProject
//
//  Created by fauquette fred on 22/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    var myModel: RowModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = myModel?.name.fullName
    }
}
