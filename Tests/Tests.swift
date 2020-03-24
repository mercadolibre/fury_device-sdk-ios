//
//  Tests.swift
//  Tests
//
//  Created by Franco Cuevas on 2/18/20.
//

import Quick
import Nimble
import MercadoPagoDevicesSDK

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("MercadoPagoDevicesSDK pod tests") {
            context("these will pass") {
                
                it("has correct vendors") {
                    let device : Device = Device()
                    let vendors : Array = device.fingerprint.vendorIds!
                    
                    expect(vendors.count) == 3
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "idfa"
                    }))
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "vendor_id"
                    }))
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "uuid"
                    }))
                }
                
                it("has correct specific attributes") {
                    let device : Device = Device()
                    let specificAttributes : VendorSpecificAttributes = device.fingerprint.vendorSpecificAttributes!
                    
                    expect(specificAttributes.canMakePhoneCalls) == false
                    expect(specificAttributes.canSendSMS) == false
                    expect(specificAttributes.simulator) == true
                    expect(specificAttributes.cpuCount) > 0
                    expect(specificAttributes.deviceIdiom) != ""
                    expect(specificAttributes.deviceLanguage) != ""
                    expect(specificAttributes.deviceModel) != ""
                }
                
                it("has correct normal attributes") {
                    let device: Device = Device()
                    expect(device.fingerprint.diskSpace) > 0
                    expect(device.fingerprint.freeDiskSpace) > 0
                    expect(device.fingerprint.ram) > 0
                    expect(device.fingerprint.os) == "iOS"
                    expect(device.fingerprint.model) != ""
                }
                
                it("can start and then retreve the device") {
                    MercadoPagoDevicesSDK.shared.execute()
                    let device:Device = MercadoPagoDevicesSDK.shared.getInfo()
                    expect(device.fingerprint.diskSpace) > 0
                    expect(device.fingerprint.freeDiskSpace) > 0
                    expect(device.fingerprint.ram) > 0
                    expect(device.fingerprint.os) == "iOS"
                    expect(device.fingerprint.model) != ""
                    
                    let specificAttributes : VendorSpecificAttributes = device.fingerprint.vendorSpecificAttributes!
                    
                    expect(specificAttributes.canMakePhoneCalls) == false
                    expect(specificAttributes.canSendSMS) == false
                    expect(specificAttributes.simulator) == true
                    expect(specificAttributes.cpuCount) > 0
                    expect(specificAttributes.deviceIdiom) != ""
                    expect(specificAttributes.deviceLanguage) != ""
                    expect(specificAttributes.deviceModel) != ""
                    
                    let vendors : Array = device.fingerprint.vendorIds!
                    
                    expect(vendors.count) == 3
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "idfa"
                    }))
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "vendor_id"
                    }))
                    
                    expect(vendors).to(containElementSatisfying({ elem in
                        return elem.name == "uuid"
                    }))
                }
                
            }
        }
    }
}
