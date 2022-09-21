//
//  Sensor.swift
//  MECS
//
//  Created by 모상현 on 2022/09/21.
//

import UIKit
class Sensor{
    var deviceId = 0
    var battery = 0
    var operation = 0
    var movement = 0
    var diaperStatues = 0
    var temp = 0
    var hum = 0
    var voc = 0
    var name = ""
    var birthday = ""
    var sex = 0
    var eat = 0
    var sens = 0
    var connect = 0
    var whereConn = 0
    var voc_avg = 0
    var dscore = 0
    var sleep = 0
    
    init(deviceID: Int,battery:Int,operation:Int,movement:Int,diaperStatues:Int,temp:Int,hum:Int, voc:Int,name:String,birthday:String,sex:Int,eat:Int,sens:Int,connect:Int,whereConn:Int,voc_avg:Int,dscore:Int,sleep:Int){
        self.deviceId = deviceID
        self.battery = battery
        self.operation = operation
        self.movement = movement
        self.diaperStatues = diaperStatues
        self.temp = temp
        self.hum = hum
        self.voc = voc
        self.name = name
        self.birthday = birthday
        self.sex = sex
        self.eat = eat
        self.sens = sens
        self.connect = connect
        self.whereConn = whereConn
        self.voc_avg = voc_avg
        self.dscore = dscore
        self.sleep = sleep
        
    }
}
