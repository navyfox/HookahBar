//
//  HookahBarTableViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 14.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class HookahBarTableViewController: UITableViewController {

    var hookahBarNames = ["Hookah Way", "Hookah Place", "The Дым", "УК", "Smoke House", "Panda", "Smoke Lab", "Hookah Time", "Fumari house", "UFS"]
    var hookahBarImages = ["hookahWay.jpg", "HP.png", "HP.png", "HP.png", "HP.png", "HP.png", "HP.png", "HP.png", "HP.png", "HP.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return hookahBarNames.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndentifire = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifire, forIndexPath: indexPath) as! HookahBarTableViewCell

        cell.nameLable.text = hookahBarNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: hookahBarImages[indexPath.row])

        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height / 2
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
