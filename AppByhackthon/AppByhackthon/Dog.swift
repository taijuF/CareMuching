//
//  Dog.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/18.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit

class Dog: NSObject {
    
    var Dog_Image : String?
    var Dog_Facility : String?
    var Dog_Age : String?
    var Dog_Breed : String?
    var Dog_Sex : String?
    var Dog_vaccine : String?
    var Dog_Story : String?
    var Dog_Pesonal : String?
    var Dog_Health : String?
    var Dog_Deliver : String?
    var Dog_Other : String?
    var Dog_Limit : String?
    var Dog_Counter : Int?
    
    init(image : String,faci : String,age : String,breed : String,sex : String,vaccine : String,story : String,perso : String,heal : String,deli : String,other : String,limit : String,counter : Int) {
        
        Dog_Image = image
        Dog_Facility = faci 
        Dog_Age = age
        Dog_Breed = breed
        Dog_Sex = sex
        Dog_vaccine = vaccine
        Dog_Story = story
        Dog_Pesonal = perso
        Dog_Health = heal
        Dog_Deliver = deli
        Dog_Other = other
        Dog_Limit = limit
        Dog_Counter = counter
        
    }
    
    
    

}
