//
//  StoreNewAlarm+CoreDataProperties.swift
//  Monit
//
//  Created by 맥 on 2018. 4. 12..
//  Copyright © 2018년 맥. All rights reserved.
//
//

import Foundation
import CoreData


extension StoreNewAlarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreNewAlarm> {
        return NSFetchRequest<StoreNewAlarm>(entityName: "StoreNewAlarm")
    }

    @NSManaged public var id: Int32
    @NSManaged public var item_type: String?
    @NSManaged public var did: String?
    @NSManaged public var aid: String?
    @NSManaged public var time: String?
    @NSManaged public var final_item_type: String?
    @NSManaged public var parent_item_type: String?
    @NSManaged public var extra: String?
    @NSManaged public var device_type: String?

}
