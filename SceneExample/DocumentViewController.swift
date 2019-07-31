//
//  DocumentViewController.swift
//  SceneExample
//
//  Created by David M Reed on 6/25/19.
//  Copyright © 2019 David M Reed. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                print("key name", Document.userActivityURLKey)
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
                if let activity = self.document?.userActivity, let userInfo = activity.userInfo {
                    if let url = userInfo[Document.userActivityURLKey] {
                        print(url)
                    } else {
                        print("no key")
                    }
                }
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.window?.windowScene?.userActivity = document?.userActivity
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.window?.windowScene?.userActivity = nil
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}

extension DocumentViewController {
    static func loadFromStoryboard() -> DocumentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "DocumentViewController") as? DocumentViewController
    }

}
