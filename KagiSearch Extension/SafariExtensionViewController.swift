//
//  SafariExtensionViewController.swift
//
//  Created by Marco Cebrián on 27/9/2021.
//  Copyright © 2021 Marco Cebrián Muiño. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
