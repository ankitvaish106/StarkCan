//
//  SlideMenuViewController.swift
//  Starkcan
//
//  Created by NTGMM-01 on 30/04/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//

import UIKit

class SlideMenuViewController: UITableViewController, ExpandableHeaderViewDelegate {
    
    

    @IBOutlet var slideMenuTableView: UITableView!
    
    var sections = [
        Section(menuName: "Products",subMenu: [],iconName: "products",expanded: false),
        Section(menuName: "Why Us",subMenu: [],iconName: "why-us",expanded: false),
        Section(menuName: "Possiblities",subMenu: [],iconName: "possiblities",expanded: false),
        Section(menuName: "Eco-Friendly",subMenu: [],iconName: "eco-friendly",expanded: false),
        Section(menuName: "About",subMenu: ["Overview","Our Founders","Vision & Mission","Our Presence"],iconName: "about",expanded: false),
        Section(menuName: "Business",subMenu: [],iconName: "business",expanded: false),
        Section(menuName: "Videos",subMenu: [],iconName: "video-yellow",expanded: false),
        Section(menuName: "Career",subMenu: [],iconName: "career",expanded: false),
        Section(menuName: "Contact",subMenu: [],iconName: "contact",expanded: false),
        Section(menuName: "MyAccount",subMenu: ["Profile","Order History","Cart"],iconName: "user-yellow",expanded: false)
        
    ]
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(sections[indexPath.section].expanded)
        {
            return 44
        }
        else
        {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].subMenu!.count
    }

    override func tableView(_ tableView: UITableView,willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].menuName, section: section, delegate: self)
        let theImageView = UIImageView(frame: CGRect(x: 5, y: 10, width: 24, height: 24));
        theImageView.image = UIImage(named: sections[section].iconName)
        //theImageView.tag = kHeaderSectionTag + section
        header.addSubview(theImageView)
         
        
       // configureCheckmark(for: header, with: sections[section])
       //
        return header
    }
    
    
    func configureCheckmark(for header: UITableViewHeaderFooterView,
                            with item: Section) {
        let label = header.viewWithTag(1001) as! UILabel
       
        if item.subMenu!.count == 0
        {
            label.text = ""
        }
        else if item.expanded && item.subMenu!.count > 0
        {
            label.text = "-"
        }
        else if !item.expanded && item.subMenu!.count > 0
        {
            label.text = "+"
        }
    }
    func toggleSection(header: UITableViewHeaderFooterView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        for i in 0 ..< sections[section].subMenu!.count
        {
            tableView.reloadRows(at: [IndexPath(row:i,section: section)], with: .automatic)
        }
    }
    
    let kHeaderSectionTag: Int = 6900;
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        let headerFrame = header.frame.size //self.view.frame.size
        let theImageView = UIImageView(frame: CGRect(x: headerFrame.width - 32, y: 13, width: 18, height: 18));
        theImageView.image = #imageLiteral(resourceName: "possiblities")
        theImageView.tag = kHeaderSectionTag + section
        header.addSubview(theImageView)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        
        if(sections[indexPath.section].subMenu?.count == 0 )
        {
            return cell
        }
        cell.textLabel?.text = sections[indexPath.section].subMenu![indexPath.row]
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
