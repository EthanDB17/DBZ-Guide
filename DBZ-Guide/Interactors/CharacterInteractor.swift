//
//  CharacterInteractor.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/31/24.
//

import Foundation

protocol CharacterInteractable {
    var hasNextCharacterPage: Bool { get }
    
    func getCharacters() async throws(AppError) -> [Character]
    func getCharacter(id: Int) async throws(AppError) -> Character
}

struct CharacterInteractor: CharacterInteractable {
    
    // MARK: - Properties -
    
    var pageManager: PageManaging
    var apiService: ApiServiceable
    
    var hasNextCharacterPage: Bool {
        return pageManager.endpointHasNextPage(.characters)
    }
    
    init(pageManager: PageManaging = PageManager(), apiService: ApiServiceable = ApiService()) {
        self.pageManager = pageManager
        self.apiService = apiService
    }
    
    // MARK: - API Interaction -
    
    func getCharacters() async throws(AppError) -> [Character] {
        guard let nextPage = pageManager.getNextPage(forEndpoint: .characters) else {
            return []
        }
        
        do {
            let pageData = try await apiService.getCharacters(page: nextPage)
            pageManager.updatePageData(currentPage: pageData.meta.currentPage, totalPages: pageData.meta.totalPages, forEndpoint: .characters)
            return pageData.items
        } catch {
            throw error
        }
    }
    
    func getCharacter(id: Int) async throws(AppError) -> Character {
        do {
            let character = try await apiService.getCharacter(id: id)
            return character
        } catch {
            throw error
        }
    }
}
