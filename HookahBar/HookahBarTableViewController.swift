//
//  HookahBarTableViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 14.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class HookahBarTableViewController: UITableViewController {



    var myHookahBar: [HookahBar] = [HookahBar(name: "Hookah Way", type: "Bar", image: "hookahWay.jpg", location: "Omsk, проспект Карла Маркса 18/8", isViseted: false), HookahBar(name: "Hookah Place", type: "Lounge-Bar", image: "hookahWay.jpg", location: "Moskow", isViseted: false), HookahBar(name: "The Дым", type: "Restaurant", image: "hookahWay.jpg", location: "Omsk", isViseted: false), HookahBar(name: "УК", type: "Lounge-Bar", image: "hookahWay.jpg", location: "Moskow", isViseted: false), HookahBar(name: "UFS", type: "Bar", image: "hookahWay.jpg", location: "Omsk", isViseted: false), HookahBar(name: "Smoke House", type: "Bar", image: "hookahWay.jpg", location: "Omsk", isViseted: false), HookahBar(name: "Fumari house", type: "Bar", image: "hookahWay.jpg", location: "Omsk", isViseted: false), HookahBar(name: "Panda", type: "Bar", image: "hookahWay.jpg", location: "Moskow", isViseted: false), HookahBar(name: "Smoke Lab", type: "Bar", image: "hookahWay.jpg", location: "Omsk", isViseted: false), HookahBar(name: "Hookah Time", type: "Bar", image: "hookahWay.jpg", location: "Omsk", isViseted: false)]


//Alert Controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    //движение влево по ячейки
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//
//    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //создаем кнопку поделится через
        let allShareAction = UITableViewRowAction(style: .Default, title: "Share") { (UITableViewRowAction, indexPath: NSIndexPath) in
            let allShareActionMenu = UIAlertController(title: nil, message: "Поделиться через", preferredStyle: .ActionSheet)

            let emailShareAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let facebookShareAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let vkShareAction = UIAlertAction(title: "VK", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

            allShareActionMenu.addAction(emailShareAction)
            allShareActionMenu.addAction(facebookShareAction)
            allShareActionMenu.addAction(vkShareAction)
            allShareActionMenu.addAction(cancelAction)

            self.presentViewController(allShareActionMenu, animated: true, completion: nil)
        }
        //кнопка удалить
        let deleteAction = UITableViewRowAction(style: .Default, title: "Удалить") { (UITableViewRowAction, NSIndexPath) in

            self.myHookahBar.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }

        allShareAction.backgroundColor = UIColor(red: 184 / 225, green: 226 / 225, blue: 181 / 225, alpha: 1.0)
        deleteAction.backgroundColor = UIColor.redColor()

        return [deleteAction, allShareAction]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)

        self.tableView.estimatedRowHeight = 85
        self.tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myHookahBar.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndentifire = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifire, forIndexPath: indexPath) as! HookahBarTableViewCell

        cell.nameLable.text = myHookahBar[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: myHookahBar[indexPath.row].image)
        cell.lacationLable.text = myHookahBar[indexPath.row].location
        cell.typeLable.text = myHookahBar[indexPath.row].type

        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height / 2
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destinationViewController as! DetailsViewController
                destinationVC.hookahBar = self.myHookahBar[indexPath.row]


            }
        }
    }


}
