//
//  LoginViewController.swift
//  Starkcan
//
//  Created by NTGMM-01 on 27/04/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userName.becomeFirstResponder()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:45/255, green: 20/255, blue:16/255, alpha:1)
        //self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func OnLoginButtonClicked(_ sender: Any) {
    
        var isUsernameFine = false
        var isPasswordFine = false
        
        if let userstring = userName?.text
        {
            if(userstring == "ashish.verma@augmatiks.com" || userstring == "ashu")
            {
                    isUsernameFine = true
            }
            else
            {
                return
            }
        }
        
        if let passstring = password?.text
        {
            if(passstring == "123456")
            {
                isPasswordFine = true
            }
            else
            {
                return
            }
        }
        
        
        if( isUsernameFine && isPasswordFine)
        {
            let alert  = UIAlertController(title: "Successfully Login", message: "Welcome to Stark-Can", preferredStyle: .alert)
            var action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: OnPopupWelcomeButtonClick)
            
            print("Do Login")
        }
        
        
    
    }
    func OnPopupWelcomeButtonClick()
    {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView,willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

   
}
