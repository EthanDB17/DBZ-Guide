//
//  APIService.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation
import APIInteractor

protocol IAPIService {
    func getCharacters(page: Int) async throws -> [Character]
    func getCharacter(id: Int) async throws -> Character
}

struct APIService {
    
    // MARK: - Properties -
    
    let endpointProvider: IEndpointProvider
    let parameterProvider: IAPIParameterProvider
    let apiExecutor: IAPIExecutor
    
    init(endpointProvider: IEndpointProvider = EndpointProvider(),
         parameterProvider: IAPIParameterProvider = APIParameterProvider(),
         apiExecutor: IAPIExecutor = APIExecutor()) {
        self.endpointProvider = endpointProvider
        self.parameterProvider = parameterProvider
        self.apiExecutor = apiExecutor
    }
    
    // MARK: - API Calls -
    
    func getCharacters(page: Int) async throws(AppError) -> [Character] {
        do {
            let endpoint = endpointProvider.provideEndpoint(for: .characters)
            let parameters = parameterProvider.provideParameterDictionary(parameters: [.page(page: page)])
            let characters: [Character] = try await apiExecutor.executeRequest(endpoint: endpoint, parameters: parameters)
            return characters
        } catch {
            throw AppError(errorType: .apiError(message: error.errorMessage))
        }
    }
    
    func getCharacter(id: Int) async throws(AppError) -> Character {
        do {
            let endpoint = endpointProvider.provideEndpoint(for: .character(id: id))
            let character: Character = try await apiExecutor.executeRequest(endpoint: endpoint, parameters: nil)
            return character
        } catch {
            throw AppError(errorType: .apiError(message: error.errorMessage))
        }
    }
    
    func getPlanets(page: Int) async throws(AppError) -> [Planet] {
        do {
            let endpoint = endpointProvider.provideEndpoint(for: .planets)
            let parameters = parameterProvider.provideParameterDictionary(parameters: [.page(page: page)])
            let planets: [Planet] = try await apiExecutor.executeRequest(endpoint: endpoint, parameters: parameters)
            return planets
        } catch {
            throw AppError(errorType: .apiError(message: error.errorMessage))
        }
    }
    
    func getPlanet(id: Int) async throws(AppError) -> Planet {
        do {
            let endpoint = endpointProvider.provideEndpoint(for: .planet(id: id))
            let planet: Planet = try await apiExecutor.executeRequest(endpoint: endpoint, parameters: nil)
            return planet
        } catch {
            throw AppError(errorType: .apiError(message: error.errorMessage))
        }
    }
}
