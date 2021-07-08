//
//  detailedViewController.swift
//  Project_Mobile
//
//  Created by Filipp Krupnov on 30/6/21.
//

import UIKit
import WebKit

var words1 : String = ""
class detailedViewController: UIViewController {
    var words1 : String = ""
    let parser = Parser()
    var contacts = [Request]()
    
   
    @IBOutlet weak var userAvatar: WKWebView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var issuesCount: UILabel!
    @IBAction func buttonUpdateInfo(_ sender: Any) {
//        stars?.text = "\(sumStar)"
//        issuesCount?.text = "\(sumIssues)"
        openUrl(urlStr: "https://github.com/\(words1)")
    }
    func openUrl(urlStr:String!) {
         if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL)
         }
    }
    
    override func viewDidLoad() {
        parser.requestData()
        userName?.text = words1
        print("\(words1) username")
        let avatarURL = URL(string: "https://avatars.githubusercontent.com/\(words1)")
        userAvatar.load(URLRequest(url: avatarURL!))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stars?.text = "\(sumStar)"
        issuesCount?.text = "\(sumIssues)"
    }
}
