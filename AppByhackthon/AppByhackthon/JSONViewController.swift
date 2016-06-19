//
//  JSONViewController.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class JSONViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        JsonLoad()
       
    }
    func JsonLoad(){

        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = NSURL(string: "http://13.73.4.120")!
        
        
        //let request: NSURLRequest = NSURLRequest(URL: url)
        
        
        var myRequest:NSURLRequest  = NSURLRequest(URL: url)
        
        do {
            
            var res:NSData = try NSURLConnection.sendSynchronousRequest(myRequest, returningResponse: nil)
            
            //var myData:NSString = NSString(data:res, encoding: NSUTF8StringEncoding)!
            
            let jsonResult : AnyObject! = try NSJSONSerialization.JSONObjectWithData(res, options: NSJSONReadingOptions.MutableContainers)
            
            if jsonResult.count > 0 {
                
                
                for var k = 0 ; k < jsonResult.count ; k++ {
                    
                   
                    
                    if let items = jsonResult as? NSArray {
                        
                        appDel.Allcount = items.count
                        
                       
                        for item in items {
                          //  print("aiueo")
                            
                            var stem1 = (item["image"] as? String)!
                            var stem2 = (item["facility"]! as? String)!
                            var stem3 = (item["age"]! as? String)!
                            var stem4 = (item["breed"]! as? String)!
                            var stem5 = (item["sex"]! as? String)!
                            var stem6 = (item["vaccine"]! as? String)!
                            var stem7 = (item["story"]! as? String)!
                            var stem8 = (item["personality"]! as? String)!
                            var stem9 = (item["health"]! as? String)!
                            var stem10 = (item["delivery_method"]! as? String)!
                            var stem11 = (item["other"]! as? String)!
                            var stem12 = (item["limit"]! as? String)!
                            
                          //  print("kakikukeko")
                            var Info = Dog(image : stem1,faci :stem2,age : stem3,breed : stem4,sex : stem5,vaccine : stem6,story : stem7,perso : stem8,heal : stem9,deli : stem10,other : stem11,limit :stem12,counter: 0)

                            appDel.All.append(Info)
                           // print("end")
                        }
                        
                       
                        
                    }
                    
                }
            }
            
            
            
        } catch  {
            // エラーが起こったらここに来るのでエラー処理などをする
        }
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

  
}
