//
//  NetworkManager.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import Foundation
import Network

class NetworkViewModel: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    @Published var isActive = false
    @Published var isExpensive = false
    @Published var isConstrained = false
    @Published var connectionType = NWInterface.InterfaceType.other
    @Published var apiKeyWarning = false
    @Published var isAPIKeySaved = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isActive = path.status == .satisfied
                self.isExpensive = path.isExpensive
                self.isConstrained = path.isConstrained
                
                let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]
                self.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other
            }
        }
        monitor.start(queue: queue)
        
        if UserDefaults.standard.string(forKey: "openAIAPIKey") != nil {
            isAPIKeySaved = true
        } else {
            isAPIKeySaved = false
        }
    }
    
    deinit {
        monitor.cancel()
    }
}
