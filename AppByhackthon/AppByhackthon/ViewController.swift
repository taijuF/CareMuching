//
//  ViewController.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/18.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import MDCSwipeToChoose
import CoreData


class ViewController: UIViewController ,MDCSwipeToChooseDelegate {
    
    var managedContext : NSManagedObjectContext? = nil
    var dogInfo : Dog?
    var saveInfo : Dog?
    var SwipeView : SwipeChoose?

    var dogsObject : [Dog?] = []
    var dog : Dog?
    
    var MDCView : SwipeChoose?
    
    var BackView : SwipeChoose?
    
    let appSize = UIScreen.mainScreen().bounds
    

    
    
    var image : UIImage?
    let appDel = UIApplication.sharedApplication().delegate as! AppDelegate


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setButton()
        /********* DogListについて **********/
        //初期の一番上のView
        self.MDCView = self.create()

        self.view.addSubview(MDCView!)
        
        //2番目のView
        self.BackView =  self.create()
        self.view.insertSubview(self.BackView!, belowSubview : MDCView!)

        /***********************************/
        
        
        /*************ナビゲーションバー関係************/
        self.title = "CareMuching"
        self.view.backgroundColor = UIColor.whiteColor()
        
        image =  UIImage(named: "Dog-50.png")
        

        var rightBtn = UIBarButtonItem(image:image, style: .Bordered, target: self, action: "DogList")
        
        rightBtn.tintColor = UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 100)
        
        self.navigationItem.rightBarButtonItem = rightBtn
        /*
        for var i in 0...5{
            
            let view = create("noimage.png")
            self.view.addSubview(yesButton2)
            self.view.addSubview(noButton2)
            self.view.addSubview(view)
        }
        */
        
        /*****左方向へのナビゲーシ*****/
        image = UIImage(named: "help-boy.png");
        var leftBtn = UIBarButtonItem(image:image, style: .Bordered, target:self, action:"RegistDog")
        leftBtn.tintColor = UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 100)
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    func DogList() {
        let listTable = DogListTableView()
        self.navigationController?.pushViewController(listTable, animated: true)
    }
    
    /** ナビゲーションバーの人をおした時の動作 **/
    func RegistDog() {
        let RegisterDogs = RegisterDogsView();
        self.navigationController?.pushViewController(RegisterDogs, animated: true)
    }
    
    
    func setButton(){
        //yesボタンの追加
        var yesButton2 = UIButton()
        yesButton2.setImage(UIImage(named:"Phone-100.png"), forState: UIControlState.Normal)
        yesButton2.frame = CGRectMake(self.view.bounds.width - 160, view.bounds.height - 160, 100, 100)
        yesButton2.addTarget(self, action: "yesClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(yesButton2)
        
        //Noボタンの追加
        var noButton2 = UIButton()
        noButton2.setImage(UIImage(named:"Hand-100.png"), forState: UIControlState.Normal)
        noButton2.frame = CGRectMake(60, view.bounds.height - 160, 100, 100)
        noButton2.addTarget(self, action: "noClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(noButton2)

    }
    
    
    
    func yesClick(sender : UIButton){
        MDCView?.mdc_swipe(.Right)
    }
    func noClick(sender : UIButton){
        MDCView?.mdc_swipe(.Left)
    }
    
    func create() -> SwipeChoose{
        let MDCOptions = MDCSwipeToChooseViewOptions()
        MDCOptions.delegate = self
        MDCOptions.likedText! = ""
        
        MDCOptions.nopeText = ""

        MDCOptions.onPan = { state -> Void in
            if state.thresholdRatio == 1 && state.direction == MDCSwipeDirection.Left {
                print("delete")
            }
        }
        let frame = CGRectMake(appSize.width-370,appSize.height-600,appSize.width-10,appSize.height-250)
        self.dogInfo = appDel.All[0]
        var view = SwipeChoose(frame:frame , options: MDCOptions,dog : self.dogInfo!)
        print(appDel.All[0])
        appDel.All.removeAtIndex(0)

        print("keoioi")
        return view
    }
    func detail(sender : UIButton){
        
        let Detail = DetailController()
        Detail.dog = MDCView?.dogOct
        
        let nav = UINavigationController(rootViewController: Detail)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    
    func writeCoreData(){
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDel.managedObjectContext
        let entity = NSEntityDescription.entityForName("DogList", inManagedObjectContext: managedContext)
        
        let dogData = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        dogData.setValue(dogInfo!.Dog_Age, forKey: "age")
        dogData.setValue(dogInfo!.Dog_Image, forKey: "image")
        dogData.setValue(dogInfo!.Dog_Facility, forKey: "facility")
        dogData.setValue(dogInfo!.Dog_Sex, forKey: "sex")
        dogData.setValue(dogInfo!.Dog_Breed, forKey: "breed")
        dogData.setValue(dogInfo!.Dog_Limit, forKey: "limit")
        dogData.setValue(dogInfo!.Dog_Other, forKey: "other")
        dogData.setValue(dogInfo!.Dog_Story, forKey: "story")
        dogData.setValue(dogInfo!.Dog_Health, forKey: "health")
        dogData.setValue(dogInfo!.Dog_Pesonal, forKey: "personal")
        dogData.setValue(dogInfo!.Dog_vaccine, forKey: "vaccine")
        
        do{
            let List = DogListTableView()
            try managedContext.save()
            List.fav.insert(dogData, atIndex: 0)
            
        }catch let error as NSError {
            
        }
        catch{}
    }
        
    //スワイプキャンセルされた時の対処(Viewにたいして)
    func viewDidCancelSwipe(view: UIView!) {
        print("canceled!!")
    }
    func view(view : UIView,shouldBeChosenWithDirection : MDCSwipeDirection) -> Bool{
        if shouldBeChosenWithDirection == MDCSwipeDirection.Left {
            return true
        }
        else {
            UIView.animateWithDuration(0.5, animations: {
                () -> Void in
                view.transform = CGAffineTransformIdentity
                view.center = view.superview!.center
            })
        }
        
        
        return true
    }
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        if wasChosenWithDirection == MDCSwipeDirection.Left {
            print("left")

        }else{
            print("right")
            writeCoreData()

        }
        if(appDel.All.count != 0){
        if(self.BackView != nil){
            self.MDCView = self.BackView
        }
        
        
        self.BackView = self.create()
        
        if(BackView != nil){
            self.BackView!.alpha = 0.0
            self.view.insertSubview(self.BackView!, belowSubview: self.MDCView!)
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.BackView!.alpha = 1.0
                },completion:nil)
        }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        
    }


}

