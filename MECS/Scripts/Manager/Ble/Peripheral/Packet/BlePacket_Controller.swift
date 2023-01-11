//
//  Peripheral_Packet.swift
//  Monit
//
//  Created by 맥 on 2017. 10. 10..
//  Copyright © 2017년 맥. All rights reserved.
//

import Foundation
import CoreBluetooth

typealias ActionResultBlePacketInfo = (BlePacketInfo?) -> ()

class BlePacketInfo {
    
    enum STATUS {
        case none
        case sending
        case fail
        case success
    }
    
    var m_completion: ActionResultBlePacketInfo?
    var m_communicationType: BLE_COMMUNICATION_TYPE?
    var m_status = STATUS.none
    var m_packet: Array<UInt8>?
    var m_receivePacket = [[UInt8]]()
    var m_packetType: BlePacketType?
    var m_retryCount = 0
    var m_sendingTime: Double = 0
    
    init (communicationType: BLE_COMMUNICATION_TYPE, packet: Array<UInt8>, packetType: BlePacketType) {
        self.m_communicationType = communicationType
        self.m_packet = packet
        self.m_packetType = packetType
    }
    
    var isRetry: Bool {
        get {
            if (m_retryCount < 2) {
                return true
            }
            return false
        }
    }
    
    var isWaiting: Bool {
        get {
            if (m_sendingTime <= 2.5) {
                return true
            }
            return false
        }
    }
}

class BlePacket_Controller {
    
    var m_parent: Peripheral_Controller?
    var m_arrRequestPacket = Array<BlePacketInfo>()

    var m_updateTimer: Timer?
    var m_timeInterval = 0.05
    
    init (parent: Peripheral_Controller) {
        self.m_parent = parent
        setInit()
    }
    
    func setInit() {
        m_updateTimer?.invalidate()
        m_updateTimer = Timer.scheduledTimer(timeInterval: m_timeInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if (m_arrRequestPacket.count <= 0) {
            return
        }
        
        if let item = m_arrRequestPacket.first {
            switch item.m_status {
            case .none:
                item.m_status = .sending
                item.m_sendingTime = 0
                Debug.print("[BLE] Request Ble Packet: TYPE(\(item.m_communicationType!)), ID(\(item.m_packetType!)), PACKET(\(item.m_packet!.description)))")
                reqeustPacket(communicationType: item.m_communicationType!, packet: item.m_packet!)
                if (item.m_communicationType == .noti) {
                    m_arrRequestPacket.removeFirst()
                }
            case .sending:
                item.m_sendingTime += m_timeInterval
                if (!item.isWaiting) {
                    item.m_status = .fail
                    Debug.print("[ERROR][BLE] packet timeout: \(item.m_packetType!)", event: .error)
                }
            case .fail:
                if (item.isRetry) {
                    item.m_retryCount += 1
                    item.m_status = .none
                    Debug.print("[ERROR][BLE] packet fail resend: \(item.m_packetType!)", event: .error)
                } else {
                    Debug.print("[ERROR][BLE] packet fail retry over: \(item.m_packetType!)", event: .error)
                    if (item.m_completion != nil) {
                        item.m_completion?(item)
                    }
                    m_arrRequestPacket.removeFirst()
                }
            case .success:
                Debug.print("[BLE] success: \(item.m_packetType!)", event: .warning)
                m_arrRequestPacket.removeFirst()
            }
        }
    }
    
    func responseCheck(_ data: [UInt8]) {
        var _isFound = false
        if let item = m_arrRequestPacket.first {
            if (item.m_communicationType == .request) {
                if let _type: BlePacketType = BlePacketType(rawValue:data[0]) {
                    if (item.m_packetType == _type) {
                        Debug.print("[BLE] Response Ble Packet: TYPE(\(item.m_communicationType!)), ID(\(item.m_packetType!)), PACKET(\(data.description)))")
                        _isFound = true
                        item.m_receivePacket.append(data)
                     
                        if (BlePacket_Utility.isLongPacket(data)) {
                            if (data[1] == data[2]) {
                                item.m_status = .success
                                if (item.m_completion != nil) {
                                    item.m_completion?(item)
                                }
                            } else {
                                item.m_sendingTime = 0
                            }
                        } else {
                            item.m_status = .success
                            if (item.m_completion != nil) {
                                item.m_completion?(item)
                            }
                        }
                    }
//                    else {
//                        Debug.print("[BLE] packet receive type match error: \(_type)")
//                        item.m_status = .fail
//                    }
                }
            } else if (item.m_communicationType == .cmd) {
                if let _type: BlePacketType = BlePacketType(rawValue:data[2]) {
                    if (item.m_packetType == _type) {
                        if (0 == data[1]) {
                            Debug.print("[BLE] Response Ble Packet: TYPE(\(item.m_communicationType!)), ID(\(item.m_packetType!)), PACKET(\(data.description)))")
                            _isFound = true
                            item.m_status = .success
                            item.m_receivePacket.removeAll()
                            item.m_receivePacket.append(data)
                            
                            if (item.m_completion != nil) {
                                item.m_completion?(item)
                            }
                        } else {
                            Debug.print("[ERROR][BLE] packet receive nack error", event: .error)
                            item.m_status = .fail
                        }
                    }
//                    else {
//                        Debug.print("[BLE] packet receive type match error: \(_type)")
//                        item.m_status = .fail
//                    }
                }
            }
        }
        
        if (!_isFound) {
            if let _type: BlePacketType = BlePacketType(rawValue:data[0]) {
                if (_type == .KEEP_ALIVE || _type == .TEMPERATURE || _type == .HUMIDITY || _type == .VOC || _type == .TOUCH || _type == .ACCELERATION || _type == .CO2 || _type == .PRESSURE || _type == .RAW_GAS || _type == .COMPENSATED_GAS) {
//                    Debug.print("[BLE] Sensor Noti Ble Packet: PACKET(\(data.description)))", event: .dev)
                } else {
                    Debug.print("[BLE] Sensor Noti Ble Packet: PACKET(\(data.description)))", event: .warning)
                }
            }
            m_parent!.m_packetSensorToLocal?.receiveNotiType(data: data)
            return
        }
    }
    
    func addPacket(_ packet: BlePacketInfo) {
        m_arrRequestPacket.append(packet)
    }
    
    func writeRequest(communicationType: BLE_COMMUNICATION_TYPE, packetType: [BlePacketType], completion: ActionResultBlePacketInfo?) {
        let _packetInfo = BlePacketInfo(communicationType: communicationType, packet: BlePacket_Utility.getRequestPacket(packetType), packetType: packetType.first!)
        _packetInfo.m_completion = completion
        addPacket(_packetInfo)
    }
    
    func writeCmd(communicationType: BLE_COMMUNICATION_TYPE, packetType: BlePacketType, packet: [UInt8], completion: ActionResultBlePacketInfo?) {
        if (packet.count > 20) {
            var chunkedData:[UInt8] = Array(repeating:0, count: 20)
            for i in 0..<packet.count {
                if (i % 20 == 0) {
                    if (i > 0) {
                        let _packetInfo = BlePacketInfo(communicationType: communicationType, packet: chunkedData, packetType: packetType)
                        _packetInfo.m_completion = completion
                        addPacket(_packetInfo)
                    }
                    chunkedData = Array(repeating:0, count: 20)
                }
                chunkedData[i % 20] = packet[i]
            }
            let _packetInfo = BlePacketInfo(communicationType: communicationType, packet: chunkedData, packetType: packetType)
            _packetInfo.m_completion = completion
            addPacket(_packetInfo)
        } else {
            let _packetInfo = BlePacketInfo(communicationType: communicationType, packet: packet, packetType: packetType)
            _packetInfo.m_completion = completion
            addPacket(_packetInfo)
        }
    }
    
    func reqeustPacket(communicationType: BLE_COMMUNICATION_TYPE, packet: [UInt8]) {
        let _data = Data(bytes: packet)
        m_parent!.m_peripheral?.writeValue(_data, for: m_parent!.m_write!, type: .withResponse)
    }
}
