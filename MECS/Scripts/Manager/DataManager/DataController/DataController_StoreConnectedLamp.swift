//
//  DataController_StoreConnectedLamp.swift
//  MECS
//
//  Created by 모상현 on 2023/01/09.
//

import Foundation

class DataController_StoreConnectedLamp {
    
    func setInit() {
        loadCoreDataToLocal()
         DataManager.instance.m_userInfo.storeConnectedLamp.syncByData()
    }
    
    func loadCoreDataToLocal() {
        let _arrData = DataManager.instance.m_coreDataInfo.storeConnectedLamp.load()
        DataManager.instance.m_userInfo.storeConnectedLamp.m_storeConnectedLamp = _arrData
    }

}
