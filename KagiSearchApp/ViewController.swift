//
//  AppDelegate.swift
//
//  Created by Marco Cebrián Muiño on 27/9/2021.
//  Copyright © 2021 Marco Cebrián Muiño. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {
    
    let extensionBundleIdentifier = "com.mcebrian.Kagi.extension"

    @IBOutlet var appNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "Kagi Search for Safari";
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
            DispatchQueue.main.async {
                NSApplication.shared.terminate(nil)
            }
        }
    }

}
