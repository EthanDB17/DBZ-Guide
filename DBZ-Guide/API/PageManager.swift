//
//  PageManager.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/31/24.
//

import Foundation

protocol PageManaging {
    func endpointHasNextPage(_ endpoint: DBZEndpoint) -> Bool
    func updatePageData(currentPage: Int, totalPages: Int, forEndpoint endpoint: DBZEndpoint)
    func getNextPage(forEndpoint endpoint: DBZEndpoint) -> Int?
}

class PageManager: PageManaging {
    
    // MARK: - Properties -
    
    var pageData: [DBZEndpoint:(currentPage: Int, totalPages: Int)] = [:]
    
    // MARK: - Page Management -
    
    func updatePageData(currentPage: Int, totalPages: Int, forEndpoint endpoint: DBZEndpoint) {
        pageData[endpoint] = (currentPage, totalPages)
    }
    
    func endpointHasNextPage(_ endpoint: DBZEndpoint) -> Bool {
        guard let pageInfo = pageData[endpoint] else {
            return true
        }
        
        return pageInfo.currentPage < pageInfo.totalPages
    }
    
    func getNextPage(forEndpoint endpoint: DBZEndpoint) -> Int? {
        guard let pageInfo = pageData[endpoint] else {
            return 1
        }
        
        if pageInfo.currentPage < pageInfo.totalPages {
            return pageInfo.currentPage + 1
        }
        
        return nil
    }
}
