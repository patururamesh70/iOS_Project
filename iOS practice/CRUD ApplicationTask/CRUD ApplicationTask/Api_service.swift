//
//  Api_service.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import Foundation


enum NetworkError: Error {
    case invalidURL, invalidResponse, serverError
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://sandbox.cynergytx.com/system-task/"
    private init() {}
    
    func fetchEmployees(completion: @escaping (Result<[Employee], NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)getAllUsers") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let employees = try JSONDecoder().decode([Employee].self, from: data)
                completion(.success(employees))
            } catch {
                completion(.failure(.invalidResponse))
            }
        }.resume()
    }

    func createOrUpdateEmployee(_ employee: Employee, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)createUser") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(employee)
            request.httpBody = jsonData
            URLSession.shared.dataTask(with: request) { data, _, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else {
                    completion(.success(true))
                }
            }.resume()
        } catch {
            completion(.failure(.invalidResponse))
        }
    }
    
    func deleteEmployee(email: String, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)deleteUser?email=\(email)") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if error == nil, (response as? HTTPURLResponse)?.statusCode == 200 {
                completion(.success(true))
            } else {
                completion(.failure(.serverError))
            }
        }.resume()
    }
}
