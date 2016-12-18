//
//  ViewController.swift
//  nicePOPUP
//
//  Created by sachin yadav on 18/12/16.
//  Copyright © 2016 sachin yadav. All rights reserved.
//

import UIKit

class vc1: UIViewController {

    @IBOutlet var imageview:UIImageView!
    @IBOutlet var btn1:UIBarButtonItem!
    @IBOutlet var view1:UIView!
    var blurEffect = UIVisualEffect()
    let blur1 = UIVisualEffectView(effect:  UIBlurEffect(style: UIBlurEffectStyle.light))

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        blurEffect = blur1.effect!
        blur1.effect = nil
        blur1.alpha = 0.970
        self.view1.center = self.view.center
        view1.alpha = 0.0
        blur1.frame = imageview.frame
        blur1.center = imageview.center
        
      self.imageview.addSubview(blur1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func add(sender:UIBarButtonItem){
        self.view.addSubview(view1)

        animate()
    }
   @IBAction func exit (sender:UIButton){
        animateout()
    }
    func animateout()
    {
        self.view1.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        UIView.animate(withDuration: 0.4, animations: {
            self.blur1.effect = nil
            self.view1.alpha = 0.0
            self.view1.transform = CGAffineTransform.identity

        },
            completion: {
                (s:Bool) in
                self.view1.removeFromSuperview()
                
        })    }

    func animate()
    {
        self.view1.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        UIView.animate(withDuration: 0.4, animations:
            {
             
                self.blur1.effect = self.blurEffect
                self.view1.alpha = 1.0
                self.view1.transform = CGAffineTransform.identity
            }
        )
    }
}

