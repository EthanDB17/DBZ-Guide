//
//  CharacterCardViewModel.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/9/24.
//

import Foundation

class CharacterCardViewModel {
    
    // MARK: - Properties -
    
    let character: Character
    let displayIndex: Int
    
    init(character: Character, displayIndex: Int) {
        self.character = character
        self.displayIndex = displayIndex
    }
}
