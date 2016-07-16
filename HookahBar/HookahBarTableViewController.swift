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
    var hookahBarLocation = ["Omsk", "Moskow", "Omsk", "Moskow", "Omsk", "Moskow", "Omsk", "Moskow", "Omsk", "Moskow"]
    var hookahBarType = ["Bar", "Lounge-Bar", "Restaurant", "Bar", "Lounge-Bar", "Restaurant", "Bar", "Lounge-Bar", "Restaurant", "Bar"]
    var hookahBarAlreadyVisited = [Bool](count: 10, repeatedValue: false)

//Alert Controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let actionMenu = UIAlertController(title: nil, message: "Что делаем?", preferredStyle: UIAlertControllerStyle.ActionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        actionMenu.addAction(cancelAction)

        let iHaveBeenThereAction = UIAlertAction(title: "Я тут был", style: .Default, handler: {(action: UIAlertAction) in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            self.hookahBarAlreadyVisited[indexPath.row] = true
        })

        let iHaveNeverBeenThereAction = UIAlertAction(title: "Я тут не был", style: .Default, handler: {(action: UIAlertAction) in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.None
            self.hookahBarAlreadyVisited[indexPath.row] = false
        })

        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == .Checkmark {
            actionMenu.addAction(iHaveNeverBeenThereAction)
        } else {
            actionMenu.addAction(iHaveBeenThereAction)
        }

        let callActionHandler = {(action: UIAlertAction!) -> Void in
            let warningMessage = UIAlertController(title: "Сервис не доступен", message: "В данный момент вы не можите позвонить, попробуйте позже", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            warningMessage.addAction(okAction)

            self.presentViewController(warningMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call Hookah Bar", style: .Destructive, handler: callActionHandler)
        actionMenu.addAction(callAction)

        self.presentViewController(actionMenu, animated: true, completion: nil)

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

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
        cell.lacationLable.text = hookahBarLocation[indexPath.row]
        cell.typeLable.text = hookahBarType[indexPath.row]

        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height / 2
        cell.thumbnailImageView.clipsToBounds = true

        cell.accessoryType = hookahBarAlreadyVisited[indexPath.row] ? .Checkmark : .None
        cell.tintColor = UIColor.blackColor()
//        cell.accessoryView = UIImageView(image: UIImage(named: "HP.png"))

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
