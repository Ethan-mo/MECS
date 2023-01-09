//
//  ViewController.swift
//  MECS
//
//  Created by 모상현 on 2022/09/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        
        //performSegue(withIdentifier: "toMenu1", sender: nil)
        
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMenu1", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenu1"{
            
            //let menuVC = segue.destination as! MainHomeSideViewController
            
        }
    }
}
//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiView: UIViewController, context: Context) {
//        // leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        ViewController()
//    }
//}
//
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            if #available(iOS 14.0, *) {
//                ViewControllerRepresentable()
//                    .ignoresSafeArea()
//                    .previewDisplayName("Preview")
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            } else {
//                // Fallback on earlier versions
//            }
//        }
//    }
//} #endif
