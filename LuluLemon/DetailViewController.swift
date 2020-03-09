//
//  DetailViewController.swift
//  LuluLemon
//
//  Created by Apple on 3/7/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func addNewItem(addItem: String)
}

class DetailViewController: UIViewController {
    
    weak var delegate: DetailViewControllerDelegate?
    
    @IBOutlet weak var addItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: Any) {
        print("save")
       
        if addItem.text!.isEmpty {
            dismiss(animated: true, completion: nil)
        } else {
            delegate?.addNewItem(addItem: addItem.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
