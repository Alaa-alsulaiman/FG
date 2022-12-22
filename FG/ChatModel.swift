//
//
//  Chat.swift
//  WhatsappUI
//
//  Created by Haipp on 26.06.21.
//
    

import Foundation


struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Message: Identifiable {
    
    enum MessageType {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.text = text
        self.type = type
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

