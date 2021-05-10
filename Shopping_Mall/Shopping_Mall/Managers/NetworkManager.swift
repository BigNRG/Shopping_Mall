//
//  NetworkManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit
import Network

final class NetworkManager {
    static func monitorNetwork()->Bool {
        let monitor = NWPathMonitor()
        var status = true
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    print("Internet status: Connected")
                    status = true
                }
            }
            else {
                DispatchQueue.main.async {
                    print("Internet status: Not Connected")
                    status = false
                }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        return status
    }
}
