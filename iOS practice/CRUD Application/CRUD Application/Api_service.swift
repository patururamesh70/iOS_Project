//
//  Api_service.swift
//  CRUD Application
//
//  Created by patururamesh on 06/11/24.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    private let baseUrl = "https://sandbox.cynergytx.com/system-task"

    func createUser(employee: EmployeeEntity, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseUrl)/createUser") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let params: [String: Any] = [
            "name": employee.name ?? "",
            "email": employee.email ?? "",
            "phone": employee.phone ?? "",
            "gender": employee.gender ?? ""
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print("Error serializing request body: \(error)")
            completion(false)
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error creating user: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }.resume()
    }

    func deleteUser(email: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseUrl)/deletUser") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let params: [String: Any] = ["email": email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting user: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }.resume()
    }
}
