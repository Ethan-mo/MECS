//
//  DataManager.swift
//  MECS
//
//  Created by 모상현 on 2023/01/09.
//

import UIKit
import CoreData

class DataManager {
    static var m_instance: DataManager!
    static var instance: DataManager {
        get {
            if (m_instance == nil) {
                m_instance = DataManager()
            }
            
            return m_instance
        }
    }
    
    private init() {
    }
    
    let m_dataController = DataController()
    let m_userInfo = UserInfo()
    let m_coreDataInfo = CoreDataInfo()
    let m_configData = ConfigData()
}
