//
//  DogListTableView.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import CoreData

class DogListTableView: UITableViewController {

    var ListTable = UITableView()
    var fav = [NSManagedObject]()
    
    var dogInst : [Dog] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListTable.frame = self.view.bounds
        
        ListTable.delegate = self
        ListTable.dataSource = self
        
        self.ListTable.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")

        
        self.view.addSubview(ListTable)
    }
    override func viewWillAppear(animated: Bool) {
        //デリゲートのインスタンスの生成
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        //保存しておくコンテクストのプロパティせ制
        let managedContext = appDelegate.managedObjectContext
        
        //リクエストした結果の格納
        let fetchRequest = NSFetchRequest(entityName: "DogList")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            fav = results as! [NSManagedObject]
            
        } catch let error as NSError {
            
        }
        print(fav.count)
        
        
        for(var i=0; i < fav.count;i++){
            
            
            let favorite = fav[i]
             var image = (favorite.valueForKey("image") as? String)
            if(image == nil){
                image = ""
            }
            var faci = favorite.valueForKey("facility") as? String
            //print(faci)
            if(faci == nil){
                faci = ""
            }
        
            var deli = favorite.valueForKey("deliver") as? String
            if(deli == nil){
                deli = ""
            }
            var heal = favorite.valueForKey("health") as? String
            if(heal == nil){
                heal = ""
            }
            var perso = favorite.valueForKey("personal") as? String
            if(perso == nil){
                perso = ""
            }
            var story = favorite.valueForKey("story") as? String
            if(story == nil){
                story = ""
            }
            var vac = favorite.valueForKey("vaccine") as? String
            if(vac == nil){
                vac = ""
            }
            var sex = favorite.valueForKey("sex") as? String
            if(sex == nil){
                sex = ""
            }
            var breed = favorite.valueForKey("breed") as? String
            if(breed == nil){
                breed = ""
            }
            var age = favorite.valueForKey("age") as? String
            if(age == nil){
                age = ""
            }
            var other = favorite.valueForKey("other") as? String
            if(other == nil){
                other = ""
            }
            var limit = favorite.valueForKey("limit") as? String
            if(limit == nil){
                limit = ""
            }

            
            
            var dog = Dog(image : image!,faci :faci!,age : age!,breed : breed!,sex : sex!,vaccine : vac!,story : story!,perso : perso!,heal : heal!,deli : deli!,other : other!,limit : limit!, counter: 1)
            
            self.dogInst.append(dog)
            
        }

    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(fav.count != 0){
            return fav.count
        }
        else{
            return 0
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : TableViewCell = ListTable.dequeueReusableCellWithIdentifier("TableViewCell") as! TableViewCell
        let image = dogInst[indexPath.row].Dog_Image
        if let url = NSURL(string: image!) {
            cell.dogImage.sd_setImageWithURL(url, placeholderImage: nil, completed: { (image, errorType, imageCacheType, url) -> Void in
                
            })
        }
        cell.breed.text = dogInst[indexPath.row].Dog_Age
        cell.sex.text = dogInst[indexPath.row].Dog_Sex
        cell.faci.text = dogInst[indexPath.row].Dog_Facility

        
       
            //cell.textLabel?.text = dogInst[0].Dog_Facility
            //print("aaaa\(cell.textLabel?.text)")
        return cell
    }
    
    
}
