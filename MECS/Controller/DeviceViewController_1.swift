//
//  DeviceViewController_1.swift
//  MECS
//
//  Created by 모상현 on 2022/09/28.
//

import UIKit

class DeviceViewController_1: UIViewController {

    @IBOutlet weak var selectView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        제스처부여하기()
        // Do any additional setup after loading the view.
    }
    func 제스처부여하기(){
        let tapGestureImageView = UITapGestureRecognizer(target: self, action: #selector(뷰를눌렀을때))
        selectView.addGestureRecognizer(tapGestureImageView) // 제스처를 추가....
        selectView.isUserInteractionEnabled = true // 유저와의 소통을 가능하게...
    }
    @objc func 뷰를눌렀을때(){
        performSegue(withIdentifier: "1to2", sender: nil)
        let vc = DeviceViewController_2()
        vc.modalPresentationStyle = .fullScreen
        print("Tap")
    }

}
