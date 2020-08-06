//
//  NetworkManager.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 05/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class NetworkManager {
    static let shared = NetworkManager()

    let networkReachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    public var isNetworkReachable = BehaviorRelay<Bool>(value: true)
    //let activeViewController: UIViewController?

    func startReachabilityObserver() {
        self.networkReachabilityManager?.startListening(onUpdatePerforming: { networkStatusListener in

            print("Network Status Changed:", networkStatusListener)

            switch networkStatusListener {
            case .notReachable:
                //self.presentAlert(message: "The network is not reachable. Please reconnect to continue using the app.")
                self.isNetworkReachable.accept(false)
                print("The network is not reachable.")
            case .unknown :
                //self.presentAlert(message: "It is unknown whether the network is reachable. Please reconnect.")
                self.isNetworkReachable.accept(false)
                print("It is unknown whether the network is reachable.")
            case .reachable(.ethernetOrWiFi):
                self.isNetworkReachable.accept(true)
                print("The network is reachable over the WiFi connection")

            case .reachable(.cellular):
                self.isNetworkReachable.accept(true)
                print("The network is reachable over the WWAN connection")
            }

        })
    }
}