//
//  StoreHubGraph+CoreDataProperties.swift
//  Monit
//
//  Created by 맥 on 2018. 4. 6..
//  Copyright © 2018년 맥. All rights reserved.
//
//

import Foundation
import CoreData


extension StoreHubGraph {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreHubGraph> {
        return NSFetchRequest<StoreHubGraph>(entityName: "StoreHubGraph")
    }

    @NSManaged public var id: Int32
    @NSManaged public var did: String?
    @NSManaged public var time: String?
    @NSManaged public var tem: String?
    @NSManaged public var hum: String?
    @NSManaged public var voc: String?

}
