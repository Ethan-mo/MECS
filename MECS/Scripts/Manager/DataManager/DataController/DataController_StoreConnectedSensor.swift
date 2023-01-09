//
//  DataController_StoreConnectedSensor.swift
//  MECS
//
//  Created by 모상현 on 2023/01/09.
//

import Foundation

class DataController_StoreConnectedSensor {
    
    func setInit() {
        loadCoreDataToLocal()
         DataManager.instance.m_userInfo.storeConnectedSensor.syncByData()
    }
    
    func loadCoreDataToLocal() {
        let _arrData = DataManager.instance.m_coreDataInfo.storeConnectedSensor.load()
        DataManager.instance.m_userInfo.storeConnectedSensor.m_storeConnectedSensor = _arrData
    }
    
}
