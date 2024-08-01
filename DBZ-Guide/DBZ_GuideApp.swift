//
//  DBZ_GuideApp.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import SwiftUI

@main
struct DBZ_GuideApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterList(viewModel: CharacterListViewModel())
        }
    }
}
