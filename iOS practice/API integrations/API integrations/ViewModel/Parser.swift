//
//  Parser.swift
//  API integrations
//
//  Created by patururamesh on 06/11/24.
//

import Foundation

struct Parser {
    
  func parse() {
    let api = URL(string: "https://api.androidhive.info/contacts/")
        
    URLSession.shared.dataTask(with: api!) {data, response, error in
        if error != nil {
            print(error?.localizedDescription.last)
            return
        }
        do {
            let result =  try JSONDecoder().decode(Welcome.self , from: data!)
            print(result)
        } catch {
            
        }
    }.resume()
    }
}
