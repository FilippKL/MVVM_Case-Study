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
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
//        print("\(userName) index")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.allowsSelection = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        userN = words[indexPath.row]
        print("\(userN) user1")
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            words.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? detailedViewController {
            destination.words1 = words[(wordsTableView.indexPathForSelectedRow?.row)!]
            wordsTableView.deselectRow(at: wordsTableView.indexPathForSelectedRow!, animated: true)
            
        }
  }
    
}

