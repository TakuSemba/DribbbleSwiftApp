//
//  DetailView.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/06/02.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var shotsLabel: UILabel!
    
    @IBOutlet weak var followersLabel: UILabel!

    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var followingsLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindViews(shot: Shot){
        imageView.sd_setImageWithURL(NSURL(string: shot.image.normal!)!)
        artistImage.sd_setImageWithURL(NSURL(string: shot.artist.avatorUrl!)!)
        roundImage(artistImage)
        artistLabel.text! += shot.artist.name!
        shotsLabel.text! += String(shot.artist.shotsCount!)
        followersLabel.text! += String(shot.artist.followersCount!)
        likesLabel.text! += String(shot.likesCount!)
        followingsLabel.text! += String(shot.artist.followingsCount!)
        commentsLabel.text! += String(shot.commentsCount!)
    }
    
    private func roundImage(image: UIImageView){
        image.layer.borderWidth = 2
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.blueishWhiteColor().CGColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}