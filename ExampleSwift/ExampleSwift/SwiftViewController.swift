//
//  ViewController.swift
//  ExampleSwift
//
//  Created by Franco Cuevas on 2/18/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import MercadoPagoDevicesSDK
import CoreLocation

class SwiftViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    var manager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestAlwaysAuthorization()
        reloadData()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleAppDidBecomeActiveNotification(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
    }
    
    @objc func handleAppDidBecomeActiveNotification(notification: Notification) {
        reloadData()
    }
    
    func reloadData() {
        let myDevice = MercadoPagoDevicesSDK.shared.getInfo()
        print(try! myDevice.toJSONString())
        
        let deviceJson = try! myDevice.toDictionary()
        let deviceJsonPretty = try! JSONSerialization.data(withJSONObject: deviceJson, options: .prettyPrinted)
        let c : String = String(data: deviceJsonPretty, encoding: .utf8)!
        
        self.text.numberOfLines = 0
        self.text.text = "\(c)"
    }

}

