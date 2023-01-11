//
//  StoreDeviceNoti+CoreDataProperties.swift
//  Monit
//
//  Created by 맥 on 2018. 3. 15..
//  Copyright © 2018년 맥. All rights reserved.
//
//

import Foundation
import CoreData


extension StoreDeviceNoti {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreDeviceNoti> {
        return NSFetchRequest<StoreDeviceNoti>(entityName: "StoreDeviceNoti")
    }

    @NSManaged public var id: Int32
    @NSManaged public var nid: Int32
    @NSManaged public var did: String?
    @NSManaged public var type: String?
    @NSManaged public var noti: String?
    @NSManaged public var extra: String?
    @NSManaged public var extra2: String?
    @NSManaged public var extra3: String?
    @NSManaged public var extra4: String?
    @NSManaged public var extra5: String?
    @NSManaged public var memo: String?
    @NSManaged public var time: String?
    @NSManaged public var finish_time: String?

}
