//
//  Document.swift
//  SceneExample
//
//  Created by David M Reed on 6/25/19.
//  Copyright © 2019 David M Reed. All rights reserved.
//

import UIKit

class Document: UIDocument {

    static let openDocActivityType = "com.dave256apps.SceneExample.openDocActivity"
    static let openDocTitle = "openDoc"
    static let openDocURLKey = "openDocURL"

    var openDocumentActivity: NSUserActivity {
        // Create an NSUserActivity for our document.
        // Note: The activityType string below must be included in your Info.plist file under the `NSUserActivityTypes` array.
        // More info: https://developer.apple.com/documentation/foundation/nsuseractivity
        let userActivity = NSUserActivity(activityType: Document.openDocActivityType)
        userActivity.title = Document.openDocTitle
        userActivity.userInfo = [Document.openDocURLKey: fileURL]
        return userActivity
    }

    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

