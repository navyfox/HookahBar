//
//  QuickReviewViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 19.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class QuickReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var windowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let darkBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let darkBlurEffectView = UIVisualEffectView(effect: darkBlurEffect)
        darkBlurEffectView.frame = view.bounds
        backgroundImageView.addSubview(darkBlurEffectView)

        let scaleAnimation = CGAffineTransformMakeScale(0.0, 0.0)
        let translationAnimation = CGAffineTransformMakeTranslation(0, 600)
        windowView.transform = CGAffineTransformConcat(scaleAnimation, translationAnimation)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {

            let scaleAnimation = CGAffineTransformMakeScale(1.0, 1.0)
            let translationAnimation = CGAffineTransformMakeTranslation(0, 0)
            self.windowView.transform = CGAffineTransformConcat(scaleAnimation, translationAnimation)

            }, completion: nil)
        
        
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
