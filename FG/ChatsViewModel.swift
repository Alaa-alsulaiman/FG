//
//
//  ChatsViewModel.swift
//  WhatsappUI
//
//  Created by Haipp on 29.06.21.
//
    

import Foundation
import SwiftUI


//func getBotResponse(message: String) -> Button<<#Label: View#>> {
//    let tempMessage = message.lowercased()
//
//    if tempMessage.contains("ok") {
          
//
//    }
//
//}


class ChatsViewModel: ObservableObject {
    
    
    
    @Published var chats = Chat.sampleChat
    
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .Sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
    
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    
    
    func getFilteredChats(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    
    func getSectionMessages(for chat: Chat) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
            if let firstMessage = tmp.first {
                let daysBetween = firstMessage.date.daysBetween(date: message.date)
                if daysBetween >= 1 {
                    res.append(tmp)
                    tmp.removeAll()
                    tmp.append(message)
                } else {
                    tmp.append(message)
                }
            } else {
                tmp.append(message)
            }
        }
        res.append(tmp)
        
        return res
    }
    
    
    
}


struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?

    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .black

    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                       .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}


extension Color{
    public static let myclor: Color = Color(UIColor(red:254/255, green:247/255, blue:245/255 , alpha:1.0))
}

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}




extension ChatView {
   
    public var payButton : some View{
        
        
        VStack{
        
        Button(action: {
            self.paymentHandler.startPayment { (success) in
                if success {
                    print("Success")
                } else {
                    print("Failed")
                }
            }
        }, label: {
            Text("Pay")
                .font(Font.custom("HelveticaNeue-Bold", size: 16))
            
                .foregroundColor(.white)
                .frame(width:100,height: 44)
        }) .background(Color.black) .cornerRadius(5)
        
        
        
    }

          
        
    }
}

extension Chat {
    
    
    static let sampleChat = [
        Chat(person: Person(name: "Hakim", imgString: "img1"), messages: [
            Message("Hey ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("I need your help in choosing the right outfit for me ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Please I need your help 😔", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sure how can I help you ?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
//
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Vladimir W.", imgString: "img6"), messages: [
            Message("Hey ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("I need your help in choosing the right outfit for me ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Please I need your help 😔", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sure how can I help you ?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
        ]),
        ////////////
        Chat(person: Person(name: "Sofie Gracia", imgString: "img3"), messages: [
            Message("Hey  👋", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("I need your help in choosing the right outfit for me ☺️", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sure how can I help you ?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("I have a job interview what is the right outfit", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("OK, but please pay $5 for one consultation", type: .Received),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Romesh", imgString: "img9"), messages: [
            Message("Hey Romesh, how is your dev journey going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Thanks for asking flo. It is going great. I just completed the HWS course. I have learned so much an now I am starting to building my own app.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("That sounds great. I'm so proud of you, that you completed the course. Most people don't have the endurance to complete it, because the cannot sit with the problem long enough. So you can definetly see this as an archievment ☺️💪", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2))
        ]),
        
        Chat(person: Person(name: "Dirk S.", imgString: "img8"), messages: [
            Message("Hey Dirk, are you from germany?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hey Flo, yes I am.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Ohh thats cool, how is your dev journey going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("SwiftUI is just amazing, it makes coding so fast and elegant. I have currently completed the 100 days of SwiftUI course from Paul Hudson. The course was awesome and I learned so much 😃", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Nice Dirk, Congratulations for completing the course. Yeah you are right, I also love developing apps in SwiftUI, because you can do so much crazy stuff with just a few lines of code.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("SwiftUI is a real game changer for IOS Development 😍", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
        ]),
        
        Chat(person: Person(name: "Sandeep", imgString: "img2"), messages: [
            Message("Hey buddy, what are you doing?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("I'm just learning SwiftUI. Do you know the awesome online course called Hacking With SwiftUI?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Oh yeah, this course is awesome. I have completed it and I can fully recommend it as well 🙏", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
        ]),
        
        Chat(person: Person(name: "Wayne D.", imgString: "img3"), messages: [
            Message("Hey Wayne, I just want to say thank you so much for your support on Patreon 🙏", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("I hope you will read this ☺️", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        ]),
    ]
}

