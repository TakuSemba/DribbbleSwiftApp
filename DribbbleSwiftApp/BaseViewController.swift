//
//  BaseViewController.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/06/02.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func setNavigationBar(title: String = "Swifffle"){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blueishWhiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.blueishBlackColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.blueishWhiteColor()
        self.navigationItem.title = title
    }
}