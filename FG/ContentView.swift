


import SwiftUI

struct ContentView: View {
    struct customColor{
        static let myColor = Color("movC")
        static let myColor1 = Color("pinkC")
        static let myColor2 = Color("orangeC")
        
    }
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""

    var body: some View {
        
        
        
        NavigationView {
            VStack{
            List {
                ForEach(viewModel.getFilteredChats(query: query)) { chat in
                    ZStack {
                        ChatRow(chat: chat)
                        
                        // hidden NavigationLink. This hides the disclosure arrow!
                        NavigationLink(destination: ChatView(chat: chat).environmentObject(viewModel)) {}
                            .buttonStyle(PlainButtonStyle())
                            .frame(width:0)
                            .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }) {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("Read", systemImage: "circle.fill")
                            }
                        }
                        .tint(customColor.myColor2)
                    }
                }
            }
            .navigationBarColor(UIColor(red:254/255, green:247/255, blue:245/255 , alpha:1.0))
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "square.and.pencil")
            })
            }
            //
        }
        }
    
    
    }
    


