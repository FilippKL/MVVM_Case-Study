//
//  ViewController.swift
//  Project_Mobile
//
//  Created by Filipp Krupnov on 30/6/21.
//

import UIKit
var userN: String = ""
class ViewController: UIViewController {
    
    var words = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        words = [""]
        wordsTableView .delegate = self
        wordsTableView .dataSource = self
    }
    
    @IBOutlet weak var wordsTableView: UITableView!
    @IBOutlet weak var WordTextfield: UITextField!
    @IBAction func addWordButtonTapped(_ sender: Any) {
        if WordTextfield.text != nil {
            let word = WordTextfield.text!
            words.append(word)
            wordsTableView.reloadData()
        }
    }
}
