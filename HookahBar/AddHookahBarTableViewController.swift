//
//  AddHookahBarTableViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 20.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class AddHookahBarTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!

    var isVisited = false

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

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage!
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveHookahBar() {
        //проверка на заполнение полей
        var error = ""
        if nameTextField.text!.isEmpty {
            error = "Название"
        } else if typeTextField.text!.isEmpty {
            error = "Тип"
        } else if locationTextField.text!.isEmpty {
            error = "Расположение"
        }

        if error != "" {
            let alertController = UIAlertController(title: "Ого", message: "Сохранение не удалось, так как поле \(error) не заполнено", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)

            return

        }

        print("Значение поля nameTextField: " + nameTextField.text!)
        print("Значение поля typeTextField: " + typeTextField.text!)
        print("Значение поля locationTextField: " + locationTextField.text!)
        print("Посетили ли вы ресторан: " + (self.isVisited ? "Да" : "Нет"))

        performSegueWithIdentifier("unwindBackToHomeScreen", sender: self)

    }

    @IBAction func isHookahBarVisited(sender: AnyObject) {
        let pressedButton = sender as! UIButton

        if pressedButton == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 0, green: 120 / 255, blue: 10 / 255, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if pressedButton == noButton {
            isVisited = false
            noButton.backgroundColor = UIColor.redColor()
            yesButton.backgroundColor = UIColor.grayColor()
        }
    }

//    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
//        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
//    }


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
