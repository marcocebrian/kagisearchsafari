//
//  AppDelegate.swift
//
//  Created by Marco Cebrián Muiño on 27/9/2021.
//  Copyright © 2021 Marco Cebrián Muiño. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet var appNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "Kagi Search for Safari";
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "com.mcebrian.Kagi-extension") { error in
            if let _ = error {
                let alert = NSAlert()
                    alert.messageText = "Error with Kagi Search Extension"
                alert.informativeText = "Oh! Wel... this is embarrasing. We would really appreciate if you could drop a line explaining what happend at "+Constants.contactMail
                alert.alertStyle = .warning
                    alert.addButton(withTitle: "OK")
                    alert.runModal()

            }
        }
    }

}
