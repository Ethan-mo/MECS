//
//  StoreConnectedSensor+CoreDataProperties.swift
//  Monit
//
//  Created by 맥 on 2017. 11. 3..
//  Copyright © 2017년 맥. All rights reserved.
//

import Foundation
import CoreData


extension StoreConnectedSensor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreConnectedSensor> {
        return NSFetchRequest<StoreConnectedSensor>(entityName: "StoreConnectedSensor")
    }

    @NSManaged public var adv: String?
    @NSManaged public var uuid: String?
    @NSManaged public var did: String?
    @NSManaged public var srl: String?
    @NSManaged public var enc: String?
    @NSManaged public var login_aid: String?
    @NSManaged public var cid: String?
    @NSManaged public var type: String?
}
