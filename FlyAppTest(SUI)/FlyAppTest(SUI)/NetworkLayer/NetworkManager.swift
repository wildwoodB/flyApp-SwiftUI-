//
//  NetworkManager.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 07.07.2023.

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseURL = "https://nu.vsepoka.ru/api/search"
    private let searchURL = baseURL + "?origin=mow&destination=led"
    
    //MARK: - Create Request Methods
    private func createRequest(with url: URL?,type: HTTPMethod,completion: @escaping(URLRequest) -> Void) {
        guard let urlString = url else { return }
        var request = URLRequest(url: urlString)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        completion(request)
    }
    //MARK: - Create Search Results Fetching Methods
    public func fetchSearcResults(comletion: @escaping(Result<MainFlyInfo,Error>) -> Void) {
        
        createRequest(with: URL(string: searchURL) , type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    comletion(.failure(APIError.faileedToGEtData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MainFlyInfo.self, from: data)
                    comletion(.success(result))
                } catch {
                    comletion(.failure(error))
                }
            }
            task.resume()
        }
    }
}



