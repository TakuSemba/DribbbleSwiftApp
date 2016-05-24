//
//  ViewController.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/24.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import UIKit
import PageMenu
import Alamofire

class MainViewController: BaseViewController {
    
    var pageMenu : CAPSPageMenu?
    
    override func loadView() {
        if let view = UINib(nibName: View.MAIN_VIEW, bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        let controllerArray : [UIViewController] = setCollections()
        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.blueishBlackColor()),
            .ViewBackgroundColor(UIColor.blueishBlackColor()),
            .SelectionIndicatorColor(UIColor.pinkColor()),
            .SelectedMenuItemLabelColor(UIColor.blueishDarkerWhiteColor()),
            .UnselectedMenuItemLabelColor(UIColor.blueishWhiteColor()),
            .SelectionIndicatorHeight(2.0),
            .MenuItemFont(UIFont(name: "HiraKakuProN-W6", size: 13.0)!),
            .MenuHeight(34.0),
            .MenuItemWidth(100.0),
            .MenuMargin(0.0),
            .MenuItemSeparatorRoundEdges(true),
            .CenterMenuItems(true)]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        self.addChildViewController(pageMenu!)
        pageMenu?.didMoveToParentViewController(self)
    }
    
    func setCollections() -> [UIViewController] {
        var controllerArray: [UIViewController] = []
        for category in ShotApi.Category.allValues{
            let shotCollection = ShotCollectionViewController(nibName: View.SHOT_CONTROLLER_VIEW, bundle: nil)
            shotCollection.title = category.rawValue
            shotCollection.category = category
            shotCollection.loadShotsFirst()
            controllerArray.append(shotCollection)
        }
        return controllerArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

