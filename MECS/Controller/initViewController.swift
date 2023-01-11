//
//  initViewController.swift
//  MECS
//
//  Created by 모상현 on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit

enum STATUS {
    case none
    case setAppData
    case appMaintenanceCheck
    case appUpdateCheck
    case commonCommand
    case loginCheck
    case setBle
    case setInit
    case setUserInfo
    case finish
    case setNotification
    case updateStatus
    case setEtc
    case initFail
    case exitApp
}

class initViewController: UIViewController {
    // MARK: - Properties
    private static var isOnce = false
    private var currentStatus: STATUS = . none
    private var updateTimer: Timer?
    private let timeInterval: Double = 0.01
    private var resedingCount: Int
    
    private var imgLogo: UIImageView = {
       let imgView = UIImageView()
        imgView.setImage(UIImage(named: <#T##String#>))
        return imgView
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad(_ animated: Bool) {
        Debug.print("[⚪️][Init] InitViewController viewDidAppear")
        configureUI()
        configure()
        firstStap()
    }
    override func
    // MARK: - Helper
    func configure() {
        updateTimer?.invalidate()
        updateTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        alwaysInit()
    }
    func configureUI() {
        view.addSubview(imgLogo)
        imgLogo.snp.makeConstraints { make in
            make.center
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }
    
    func firstStap() {
        resedingCount = 0 // 뭔지 잘 모르겠음
        changeState(category: .setAppData)
    }
    func changeState(category: STATUS) {
        if (category == m_status) {
            return
        }
        m_status = category
        switch category {
        case .setAppData:
            Debug.print("[⚪️][Init] STATUS.setAppData")
            setInitAppData()
        case .appUpdateCheck:
            Debug.print("[⚪️][Init] STATUS.appUpdateCheck")
            checkUpdate()
        case .appMaintenanceCheck:
            Debug.print("[⚪️][Init] STATUS.appMaintenanceCheck")
            checkMaintenance()
        case .commonCommand:
            Debug.print("[⚪️][Init] STATUS.commonCommand")
            commonCommand()
        case .loginCheck:
            Debug.print("[⚪️][Init] STATUS.loginCheck")
            checkLogin()
        case .setBle:
            Debug.print("[⚪️][Init] STATUS.setBle")
            setBle()
        case .setInit:
            Debug.print("[⚪️][Init] STATUS.setInit")
            setInitInfo()
        case .setUserInfo:
            Debug.print("[⚪️][Init] STATUS.setUserInfo")
            getUserInfo()
        case .finish:
            Debug.print("[⚪️][Init] STATUS.finish")
            setFinish()
        case .setNotification:
            Debug.print("[⚪️][Init] STATUS.setNotification")
            setNotification()
        case .updateStatus:
            Debug.print("[⚪️][Init] STATUS.updateStatus")
            updateStatus()
        case .setEtc:
            Debug.print("[⚪️][Init] STATUS.setEtc")
            setEtc()
        case .initFail:
            Debug.print("[⚪️][Init] STATUS.initFail")
            initFail()
        case .exitApp:
            Debug.print("[⚪️][Init] STATUS.exitApp")
            exitApp()
        default: break
        }
    }
    func setInitAppData() {
        if (DataManager.instance.m_configData.appData == "" || DataManager.instance.m_configData.localAppData == "") {
            let _send = Send_GetAppData()
            _send.os = Config.OS
            _send.atype = Config.channelOsNum
            _send.isResending = true
            NetworkManager.instance.Request(_send) { (json) -> () in
                let receive = Receive_GetAppData(json)
                switch receive.ecd {
                case .success:
                    DataManager.instance.m_configData.appData = receive.appdata ?? ""
                    DataManager.instance.m_configData.localAppData = receive.appdata2 ?? ""
                    
                    Widget_Utility.setSharedInfo(channel: Config.channelOsNum, key: .appData, value: receive.appdata ?? "")
                    self.changeState(category: .appMaintenanceCheck)
                default:
                    Debug.print("[⚪️][Init][ERROR] invaild errcod", event: .error)
                    self.changeState(category: .exitApp)
                }
            }
        } else {
            changeState(category: .appUpdateCheck)
        }
    }
    
        
    }
    // MARK: - Selector
    @objc func update() {
        
    }
}
