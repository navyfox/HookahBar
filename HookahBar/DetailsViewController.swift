//
//  DetailsViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 19.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var hookahBarImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var hookahBar: HookahBar!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hookahBarImageView.image = UIImage(named: hookahBar.image)
        self.tableView.backgroundColor = UIColor(red: 250 / 255, green: 212 / 255, blue: 225 / 255, alpha: 1.0)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 250 / 255, green: 212 / 255, blue: 225 / 255, alpha: 1.0)

        title = hookahBar.name
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifire = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifire, forIndexPath: indexPath) as! DetailsTableViewCell

        switch indexPath.row {
        case 0:
            cell.keyLable.text = "Название:"
            cell.valueLable.text = hookahBar.name
        case 1:
            cell.keyLable.text = "Тип:"
            cell.valueLable.text = hookahBar.type
        case 2:
            cell.keyLable.text = "Расположение:"
            cell.valueLable.text = hookahBar.location
        case 3:
            cell.keyLable.text = "Был(а) там:"
            cell.valueLable.text = hookahBar.isViseted ? "Да" : "Нет"
        default:
            cell.keyLable.text = ""
            cell.valueLable.text = ""
        }

        cell.backgroundColor = UIColor.clearColor()

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
