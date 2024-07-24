//
//  Color+Extensions.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/24/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        self.init(uiColor: UIColor(hex: hex))
        return 
    }
}
