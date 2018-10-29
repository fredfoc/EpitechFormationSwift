//
//  MyTableViewController.swift
//  TableViewProject
//
//  Created by fauquette fred on 22/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

struct RowModel: Decodable {
    let name: RowName
}

struct RowName: Decodable {
    let last: String
    let first: String
}

struct ResultAPI: Decodable {
    let results: [RowModel]
}

class MyTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var myModels: ResultAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        
        ModelPresenter().getModel {[weak self] (result) in
            print("get result")
            self?.myModels = result
            self?.tableView.reloadData()
        }
        print("end viewDidLoad")
    }
}

extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let results = myModels?.results else {
            return 0
        }
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",
                                                 for: indexPath)
        let myModel = myModels?.results[indexPath.row]
        cell.textLabel?.text = myModel?.name.fullName
        return cell
    }
}

extension MyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailVC")
        if let detailViewController = detailViewController as? DetailViewController {
            let myModel = myModels?.results[indexPath.row]
            detailViewController.myModel = myModel
        }
        navigationController?.show(detailViewController, sender: nil)
    }
}
