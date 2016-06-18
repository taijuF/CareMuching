//
//  DetailController.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/18.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import CoreData

class DetailController: UIViewController {

    var barButton : UIBarButtonItem?
    
    var BackImage : UIImageView?
    
    var FrontImage : UIImageView?
    
    var dog : Dog?
    

    
    let myApp = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "詳細画面"
        
        barButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "Return")
        
        self.navigationItem.rightBarButtonItem = barButton

        self.view.backgroundColor = UIColor.whiteColor()
        
        var naviSize = self.navigationController?.navigationBar.frame.height
        setBackView(Int(naviSize!))
        
        
        setFrontView()
            
        
        
        
    }
    func setFrontView(){
        FrontImage = UIImageView()
        
        FrontImage?.frame = CGRectMake(myApp.width/3 - 50, 80,myApp.width / 4, myApp.height/6)
        let image = dog!.Dog_Image
        // var local =
        if let url = NSURL(string: image!) {
            FrontImage?.sd_setImageWithURL(url, placeholderImage: nil, completed: { (image, errorType, imageCacheType, url) -> Void in
                
            })
        }
        
        self.view.addSubview(FrontImage!)

    }
    func setBackView(naviSize : Int){
        BackImage = UIImageView()
        
        BackImage?.frame = CGRectMake(-120,30,myApp.width+200, myApp.height/3 + 120)
        let image = dog!.Dog_Image
        // var local =
        if let url = NSURL(string: image!) {
            BackImage?.sd_setImageWithURL(url, placeholderImage: nil, completed: { (image, errorType, imageCacheType, url) -> Void in
                
            })
        }
        var BlurFilter = CIFilter(name: "CIGaussianBlur")
        BlurFilter!.setValue(CIImage(image: (BackImage?.image)!), forKey: kCIInputImageKey)
        
        let output : CIImage = (BlurFilter?.outputImage)!
        BackImage?.image = UIImage(CIImage : output)
        self.view.addSubview(BackImage!)

    }
    
    func Return(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
