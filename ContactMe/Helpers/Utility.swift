//
//  Utility.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    // Function to refresh Tableview on main thread
    
    
    class func reloadTableView(with tableView:UITableView) {
        
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
    
    
    // To show alert on the top most view controller
    class  func showMessage(with message: String) {
        let alertController = UIAlertController(title: "Birthdays", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let dismissAction = UIAlertAction(title:StringConstants.kOkTitle, style: UIAlertActionStyle.default) { (action) -> Void in
        }
        alertController.addAction(dismissAction)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let pushedViewControllers = (appDelegate.window?.rootViewController as! UINavigationController).viewControllers
        
        // find the top most view controller on the navigation stack
        let presentedViewController = pushedViewControllers[pushedViewControllers.count - 1]
        presentedViewController.present(alertController, animated: true, completion: nil)
    }
    
}

