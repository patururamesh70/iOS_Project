//
//  Parser.swift
//  WeatherAPi
//
//  Created by patururamesh on 09/09/24.
//


import Foundation

class ChatViewModel {
    private let chatService = ChatService()
    private(set) var messages: [Message] = [] {
        didSet {
            self.onMessagesUpdated?()
        }
    }
    
    var onMessagesUpdated: (() -> Void)?
    
    func fetchMessages(forConversationId conversationId: String) {
        chatService.fetchMessages(forConversationId: conversationId) { [weak self] fetchedMessages in
            self?.messages = fetchedMessages
        }
    }
    
    func sendMessage(_ text: String, from senderId: String, to receiverId: String, completion: @escaping (Bool) -> Void) {
        let newMessage = Message(id: UUID().uuidString, senderId: senderId, receiverId: receiverId, text: text, timestamp: Date())
        chatService.sendMessage(newMessage) { success in
            if success {
                self.messages.append(newMessage)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

