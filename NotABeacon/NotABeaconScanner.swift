//
//  NotABeaconScanner.swift
//  NotABeacon
//
//  Created by David G. Young on 11/16/24.
//

import CoreBluetooth

class NotABeaconScanner: NSObject, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!
    
    func start() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager?.scanForPeripherals(withServices: [CBUUID(string: "4c052726-cd97-4dde-9356-212cc1327a84")], options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let serviceData = advertisementData["kCBAdvDataServiceData"] as? NSDictionary {
            for key in serviceData.allKeys {
                if let data = serviceData[key] as? Data {
                    if data.count >= 7 {
                        NSLog("Detected not-a-beacon")
                        NSLog("Service: \(key)");
                        NSLog("Data values: \(data.hexDescription)")
                    }
                }
            }
        }
    }
}

extension Data {
    var hexDescription: String {
        return reduce("") {$0 + String(format: "%02x", $1)}
    }
}
