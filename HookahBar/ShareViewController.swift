//
//  ShareViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 20.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var topLeft: UIView!
    @IBOutlet weak var topRight: UIView!
    @IBOutlet weak var bottomRight: UIView!
    @IBOutlet weak var bottomLeft: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        topLeft.transform = CGAffineTransformMakeTranslation(0, -500)
        topRight.transform = CGAffineTransformMakeTranslation(0, -500)
        bottomRight.transform = CGAffineTransformMakeTranslation(0, 500)
        bottomLeft.transform = CGAffineTransformMakeTranslation(0, 500)

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.topLeft.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.topRight.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.bottomRight.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.bottomLeft.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
