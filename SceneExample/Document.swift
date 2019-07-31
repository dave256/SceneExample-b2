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
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

