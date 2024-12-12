//
//  chat.swift
//  WeatherAPi
//
//  Created by patururamesh on 09/09/24.
//

import Foundation

class ChatService {
    
    func fetchMessages(forConversationId conversationId: String, completion: @escaping ([Message]) -> Void) {
        // Simulating a network request
        let messages = [Message(id: "1", senderId: "user1", receiverId: "user2", text: "Hello!", timestamp: Date())]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(messages)
        }
    }
    
    func sendMessage(_ message: Message, completion: @escaping (Bool) -> Void) {
        // Simulating a network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true)
        }
    }
}

