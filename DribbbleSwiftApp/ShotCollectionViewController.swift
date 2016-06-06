//
//  ShotCollectionViewController.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/31.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//


import UIKit
import RxSwift
import WebImage

class ShotCollectionViewController: UICollectionViewController {
    
    private var shots:[Shot] = [Shot]() {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    var page: Int = 0
    var category: ShotApi.Category?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: View.SHOT_COLLECTION_VIEW_CELL, bundle:nil)
        self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: View.SHOT_COLLECTION_VIEW_CELL)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshInvoked), forControlEvents: UIControlEvents.ValueChanged)
        collectionView?.addSubview(refreshControl)
    }
    
    func loadShotsFirst(){
        loadShots(0)
    }
    
    func loadShotsMore(){
        loadShots(page)
    }
    
    func loadShots(page: Int){
        ShotApi.getShots(page, category: category!)
            .subscribeOn(SerialDispatchQueueScheduler(globalConcurrentQueueQOS: .Default))
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { shots in
                    for i in 0 ..< shots.count {
                        self.shots.append(shots[i])
                    }
                    self.collectionView?.reloadData()
                },
                onError: { error in
                    print(error)
                },
                onCompleted: {
                },
                onDisposed: {
                }
            )
            .addDisposableTo(disposeBag)
    }
    
    func refreshInvoked(sender:AnyObject) {
        sender.beginRefreshing()
        self.shots.removeAll()
        loadShotsFirst()
        sender.endRefreshing()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count == 0 ? 24 : shots.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(View.SHOT_COLLECTION_VIEW_CELL, forIndexPath: indexPath) as! ShotCollectionViewCell
        
        if shots.count != 0 {
            let shot = shots[indexPath.row]
            cell.imageView.sd_setImageWithURL(NSURL(string: shot.image.teaser!)!)
        } else {
            let placeHolder = UIImage(named: "dribbble_placeholder2.png")
            cell.imageView.image = placeHolder
        }
        
        if shots.count - 1 == indexPath.row && page < 5 {
            page += 1
            loadShotsMore()
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if shots.count == 0 {
            return
        }
        let storyboard = UIStoryboard(name: StoryBoard.MAIN, bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(Controller.DETAIL_VIEW_CONTROLLER) as! DetailViewController
        vc.shot = shots[indexPath.row]
        let navigationController = UINavigationController(rootViewController: vc)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = view.frame.width / 3 - 4
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
