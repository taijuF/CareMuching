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
    

    @IBOutlet weak var DetailText: UITextView!
    
    let myApp = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "詳細画面"
        
        barButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "Return")
        
        self.navigationItem.rightBarButtonItem = barButton

        self.view.backgroundColor = UIColor.whiteColor()
        
        var naviSize = self.navigationController?.navigationBar.frame.height
        setBackView()
        
        
        setFrontView()
        
        DetailText.text = "所在地 :\((dog!.Dog_Facility)!)\n健康状態 :\((dog!.Dog_Health)!)\nワクチン : \((dog!.Dog_vaccine)!)\n性格 : \((dog!.Dog_Pesonal)!)\n年齢 : \((dog!.Dog_Age)!)\n性別 : \((dog!.Dog_Sex)!)\nこの犬の人生 : \((dog!.Dog_Story)!)\n血統 : \((dog!.Dog_Breed)!)\n\((dog!.Dog_Limit)!)\nその他 : \((dog!.Dog_Other)!) "
        
        //facility
//        var label = UILabel()
//        label.frame = CGRectMake(20, self.view.bounds.height - 200, self.view.bounds.width-20, 30)
//        label.text = "所在地 :\((dog!.Dog_Facility)!)"
//        label.textColor = UIColor(red: 143/255, green: 139/255, blue: 138/255, alpha: 1.0)
//        
//        self.view.addSubview(label)
//        
//        var label2 = UILabel()
//        label.frame = CGRectMake(20, self.view.bounds.height - 140, self.view.bounds.width-20, 30)
//        label.text = "健康状態 :\((dog!.Dog_Health)!)"
//        label.textColor = UIColor(red: 143/255, green: 139/255, blue: 138/255, alpha: 1.0)
//        
//        self.view.addSubview(label2)
        
        
        
//        
//        if((dog!.Dog_Counter)! == 1){
//            setFavButton()
//        }
//        else{
//            setFavButton2()
//        }
//
//        
    }
    /*
    func setFavButton(){
        
        var FavButton = UIButton()
        FavButton.setImage(UIImage(named:"Ribbon-50.png"), forState: UIControlState.Normal)
        FavButton.frame = CGRectMake(myApp.width - 50, 30, 50, 80)
//        FavButton.addTarget(self, action: "yesClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(FavButton)
        
    }
    
    func setFavButton2(){
        
        var FavButton = UIButton()
        FavButton.setImage(UIImage(named:"Ribbon-51.png"), forState: UIControlState.Normal)
        FavButton.frame = CGRectMake(self.view.bounds.width - 160, view.bounds.height - 160, 100, 100)
        FavButton.addTarget(self, action: "FavClick:", forControlEvents: UIControlEvents.TouchUpInside)
        print(dog!.Dog_Counter)
        print("set")
        self.view.addSubview(FavButton)
        
    }
 */
    func setFrontView(){
        FrontImage = UIImageView()
        
        FrontImage?.frame = CGRectMake(myApp.width/3 - 20,100,myApp.width / 4+80, myApp.height/6+80)
        let image = dog!.Dog_Image
        // var local =
        if let url = NSURL(string: image!) {
            FrontImage?.sd_setImageWithURL(url, placeholderImage: nil, completed: { (image, errorType, imageCacheType, url) -> Void in
                
            })
        }
        
        
        self.view.addSubview(FrontImage!)
        
        
        
    }
    func setBackView(){
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
