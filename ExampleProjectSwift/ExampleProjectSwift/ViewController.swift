//
//  ViewController.swift
//  ExampleProjectSwift
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

import UIKit
import RSGithubRepoListing

class ViewController: UIViewController {

	@IBOutlet weak var repoLabel: UILabel!
	@IBOutlet weak var usernameTextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	// MARK: - Event Handler Methods -
	@IBAction func submitBtnClicked(_ sender: Any) {
	
		self.view.endEditing(true)
		let username = (self.usernameTextField.text)!.replacingOccurrences(of: " ", with: "")
	
		let gitServices = GithubServices()
		gitServices.getGithubRepos(forUsername: username) { [weak self] (allRepos) in
			
			var reposString = ""
			
			if allRepos.count == 0 {
				reposString = "No repos present."
			} else {
				for repo in allRepos {
					reposString = reposString + "-" + repo.name + "\n"
				}
			}
			
			DispatchQueue.main.async {
				self?.repoLabel.text = reposString
				self?.repoLabel.isHidden = false
			}
		}
	}
	
}

