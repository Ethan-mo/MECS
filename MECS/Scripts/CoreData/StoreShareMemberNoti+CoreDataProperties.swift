//
//  StoreShareMemberNoti+CoreDataProperties.swift
//  Monit
//
//  Created by 맥 on 2018. 3. 15..
//  Copyright © 2018년 맥. All rights reserved.
//
//

import Foundation
import CoreData


extension StoreShareMemberNoti {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreShareMemberNoti> {
        return NSFetchRequest<StoreShareMemberNoti>(entityName: "StoreShareMemberNoti")
    }

    @NSManaged public var id: Int32
    @NSManaged public var noti: String?
    @NSManaged public var time: String?
    @NSManaged public var extra: String?

}
