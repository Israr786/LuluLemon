//
//  ViewController.swift
//  LuluLemon
//
//  Created by Apple on 3/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var arrayData = [String]()
    var userDefault: UserDefaults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupHeaderView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Lists"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        userDefault = UserDefaults.standard
    }
    
    func setupHeaderView() {
       let container = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        var segControl = UISegmentedControl()
        segControl = UISegmentedControl(items: ["Alpha","Creation Time"])
        container.addSubview(segControl)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.topAnchor.constraint(equalTo: container.topAnchor,constant: 5).isActive = true
        segControl.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        segControl.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5).isActive = true
        segControl.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        container.backgroundColor = .white
        tableView.tableHeaderView = container
    }
    
    @objc func handleAdd() {
        print("add")
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        navigationController?.present(detailVC, animated: true, completion: nil)
        detailVC.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayData = userDefault?.object(forKey: "dressArray") as! [String]
        return arrayData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        cell.textLabel?.text = arrayData[indexPath.row]
        return cell
    }
}

extension ViewController: DetailViewControllerDelegate {
    func addNewItem(addItem: String) {
        arrayData.append(addItem)
        let sortedArray = arrayData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        userDefault?.set(sortedArray, forKey: "dressArray")
        userDefault?.synchronize()
        tableView.reloadData()
    }
}

