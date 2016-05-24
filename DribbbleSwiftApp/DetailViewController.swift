//
//  DetailController.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/06/02.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var shot: Shot?
    
    var detailView: DetailView!
    
    override func loadView() {
        if let view = UINib(nibName: View.DETAIL_VIEW, bundle: nil).instantiateWithOwner(self, options: nil).first as? DetailView {
            self.view = view
            detailView = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(shot!.title!)
        let backButton = UIBarButtonItem(title: "back", style: .Plain, target: self, action: #selector(DetailViewController.backClicked(_:)))
        self.navigationItem.leftBarButtonItem = backButton
        detailView.bindViews(shot!)
    }
    
    func backClicked(sender: AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}