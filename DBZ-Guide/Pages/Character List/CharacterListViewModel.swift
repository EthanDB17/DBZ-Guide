//
//  CharacterListViewModel.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/31/24.
//

import Foundation
import Observation

@Observable
final class CharacterListViewModel: @unchecked Sendable {
    
    // MARK: - Types -
    
    enum State: Equatable {
        case loadingFirstPage
        case loadingNextPage
        case loaded
        case error(AppError)
        
        static func == (lhs: CharacterListViewModel.State, rhs: CharacterListViewModel.State) -> Bool {
            switch (lhs, rhs) {
            case (.loadingFirstPage, .loadingFirstPage): return true
            case (.loadingNextPage, .loadingNextPage): return true
            case (.loaded, .loaded): return true
            case (.error(_), .error(_)): return true
            default: return false
            }
        }
    }
    
    // MARK: - Properties -
    
    @MainActor private(set) var characters: [Character] = []
    @ObservationIgnored var interactor: CharacterInteractable
    @ObservationIgnored var characterTask: Task<(), Never>?
    var state: State = .loadingFirstPage
    
    @MainActor
    @ObservationIgnored private var pageThreshold = 2
    
    init(interactor: CharacterInteractable = CharacterInteractor()) {
        self.interactor = interactor
        self.updateThreshold()
        self.fetchFirstPage()
    }
    
    // MARK: - View Management -
    
    func updateThreshold() {
        Task {
            let isIpad = await DeviceType.shared.isIpad
            if isIpad {
                await MainActor.run {
                    self.pageThreshold = 4
                }
            }
        }
    }
    
    @MainActor
    func checkIfNextPageIsNeeded(displayIndex: Int) {
        if characters.count - pageThreshold > displayIndex {
            return
        }
        
        if !interactor.hasNextCharacterPage {
            return
        }
        
        if state == .loadingNextPage {
            return
        }
        
        fetchNextPage()
    }
    
    // MARK: - Data Fetch -
    
    private func fetchFirstPage() {
        state = .loadingFirstPage
        fetchCharacters()
    }
    
    private func fetchNextPage() {
        state = .loadingNextPage
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        characterTask?.cancel()
        characterTask = Task {
            do {
                let pageCharacters = try await self.interactor.getCharacters()
                await MainActor.run {
                    if !pageCharacters.isEmpty {
                        self.characters.append(contentsOf: pageCharacters)
                    }
                    self.state = .loaded
                }
            } catch {
                if let appError = error as? AppError {
                    self.state = .error(appError)
                } else {
                    self.state = .error(AppError(errorType: .apiError(message: error.localizedDescription)))
                }
                print("Characters fetch error: \(error.localizedDescription)")
            }
        }
    }
}
