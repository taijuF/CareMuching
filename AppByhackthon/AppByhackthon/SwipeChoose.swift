//
//  SwipeChoose.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/18.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import MDCSwipeToChoose

class SwipeChoose: MDCSwipeToChooseView {
    
    var dogOct : Dog?
    
    init(frame : CGRect , options : MDCSwipeToChooseViewOptions,dog : Dog){
        super.init(frame:frame,options : options)
        dogOct = dog
        
        imageViewSet()
        setButtonLabel()
        
        backgroundColor = UIColor.whiteColor()
        likedView.frame = CGRectMake(0, 0, 0, 0)
        nopeView.frame = CGRectMake(0, 0, 0, 0)
    }
    
    private func imageViewSet(){
        //ImageViewのset
        let image = dogOct?.Dog_Image
       // var local =
        if let url = NSURL(string: image!) {
            self.imageView.sd_setImageWithURL(url, placeholderImage: nil, completed: { (image, errorType, imageCacheType, url) -> Void in
                
            })
        }

       // self.imageView.image = UIImage(named: (dogOct?.Dog_Image)!)
        self.imageView.frame = CGRectMake(0,0,self.bounds.width,self.bounds.height - 60)

    }
    
    private func setButtonLabel(){
        let viewCon = ViewController()
        var button = UIButton()
        button.setImage(UIImage(named:"menu"), forState: UIControlState.Normal)
        button.frame = CGRectMake(self.bounds.width - 50, self.bounds.height - 50, 40, 40)
        button.addTarget(viewCon, action: "detail:", forControlEvents: UIControlEvents.TouchUpInside)
    
        //場所ラベルの追加
        var label = UILabel()
        label.frame = CGRectMake(20, self.bounds.height - 50, 200, 40)
        label.text = dogOct?.Dog_Facility
        label.textColor = UIColor(red: 143/255, green: 139/255, blue: 138/255, alpha: 1.0)
        
        addSubview(button)
        addSubview(label)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

