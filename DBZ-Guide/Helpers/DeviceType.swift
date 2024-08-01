//
//  DeviceType.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 8/1/24.
//

import Foundation
import UIKit

@MainActor
struct DeviceType {
    
    static let shared = DeviceType()
    
    private init() {}
    
    var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
