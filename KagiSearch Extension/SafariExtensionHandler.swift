//
//  SafariExtensionHandler.swift
//
//  Created by Marco Cebrián on 27/9/2021.
//  Copyright © 2021 Marco Cebrián Muiño. All rights reserved.
//
import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when the script calls safari.extension.dispatchMessage("message").
        page.getPropertiesWithCompletionHandler { properties in
            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        
    }
    
    override func page(_ page: SFSafariPage, willNavigateTo url: URL?) {
        if let userUrl = url {
        // NSLog("KAGI SEARCH - Host:\(url.host)  Fragment:\(url.fragment)  Query:\(url.query)")
            if let newURL = SearchSourcesManager.shared.newSearchURLFor(url: userUrl){
                page.getContainingTab(completionHandler: {(tab) in
                    tab.navigate(to: newURL)
                })
            }
        }
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }
    
}
