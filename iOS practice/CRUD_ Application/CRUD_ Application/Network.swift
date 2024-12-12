//
//  Network.swift
//  CRUD_ Application
//
//  Created by patururamesh on 07/11/24.
//

import Foundation
import Network

func isConnectedToInternet() -> Bool {
    let monitor = NWPathMonitor()
    var isConnected = false
    monitor.pathUpdateHandler = { path in
        if path.status == .satisfied {
            isConnected = true
        }
    }
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    monitor.start(queue: queue)
    return isConnected
}
