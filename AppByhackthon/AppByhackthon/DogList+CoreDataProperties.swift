//
//  DogList+CoreDataProperties.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DogList {

    @NSManaged var image: String?
    @NSManaged var facility: String?
    @NSManaged var deliver: String?
    @NSManaged var health: String?
    @NSManaged var personal: String?
    @NSManaged var story: String?
    @NSManaged var vaccine: String?
    @NSManaged var sex: String?
    @NSManaged var breed: String?
    @NSManaged var age: String?
    @NSManaged var other: String?
    @NSManaged var limit: String?

}
