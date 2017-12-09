//
//  ContactDetailViewController.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import Contacts

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var contactDetails:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ContactDetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return
                contactDetails.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.ContactDpCell, for: indexPath) as! ContactImageCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.ContactDetailCell, for: indexPath) as! ContactDetailCell
            
            return cell
        }
    }
}

extension ContactDetailViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
