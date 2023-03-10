

import SwiftUI


struct ChatView: View {
    
    struct customColor{
        static let myColor = Color("movC")
        static let myColor1 = Color("pinkC")
        static let myColor2 = Color("orangeC")
        
    }
    let paymentHandler = PaymentHandler()
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    
    @State private var messageIDToScroll: UUID?
    
    let spacing: CGFloat = 10
    let minSpacing: CGFloat = 3
    
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                getChatsView(viewWidth: reader.size.width)
                    .onTapGesture {
                        isFocused = false
                    }
            }
            toolbarView().padding(.bottom,80)
        }
        .background(customColor.myColor)
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 1)
        .navigationBarItems(leading: navBarLeadingBtn(), trailing: navBarTrailingBtn())
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(UIColor(red:254/255, green:247/255, blue:245/255 , alpha:1.0))
        
        .onAppear {
            viewModel.markAsUnread(false, chat: chat)
        }
    }
    
    
    func getChatsView(viewWidth: CGFloat) -> some View {
        ScrollView {
            ScrollViewReader { scrollReader in
                LazyVGrid(columns: [GridItem(.flexible(minimum: 0))], spacing: 0, pinnedViews: [.sectionHeaders]) {
                    let sectionMessages = viewModel.getSectionMessages(for: chat)
                    ForEach(sectionMessages.indices, id: \.self) { i in
                        let messages = sectionMessages[i]
                        Section(header: sectionHeader(firstMessage: messages.first!)) {
                            ForEach(messages) { message in
                                let isReceived = message.type == .Received
                                
                                HStack {
                                    ZStack {
                                        Text(message.text)
                                            .padding(.horizontal)
                                            .padding(.vertical, 12)
                                            .background(isReceived ? customColor.myColor2.opacity(0.2) : customColor.myColor2.opacity(0.9))
                                            .cornerRadius(13)
                                    }
                                    .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading  : .trailing)
                                    .padding(.vertical, 5)
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: isReceived ? .leading  : .trailing)
                                .id(message.id)
                            }
                        }
                    }
                    .onChange(of: isFocused) { _ in
                        if isFocused {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    scrollReader.scrollTo(chat.messages.last!.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                    .onChange(of: messageIDToScroll) { _ in
                        // This scrolls down to the new sent Message
                        if let messageID = messageIDToScroll {
                            DispatchQueue.main.async {
                                withAnimation(.easeIn) {
                                    scrollReader.scrollTo(messageID)
                                }
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            scrollReader.scrollTo(chat.messages.last!.id, anchor: .bottom)
                        }
                    }
                    payButton
                }
                .padding(.horizontal)
            }
        }
        .background(Color.myclor).ignoresSafeArea()
    }
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 44
            HStack {
                TextField("Message...", text: $text)
                    .padding(.horizontal, 20)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                Button(action: {
                    if let newMessage = viewModel.sendMessage(text, in: chat) {
                        text = ""
                        messageIDToScroll = newMessage.id
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
            }
            .frame(height: height)
        }
        .padding(.vertical, 20)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sectionHeader(firstMessage message: Message) -> some View {
        ZStack {
//let color = Color(hue: 0.587, saturation: 0.742, brightness: 0.924)
            Text(message.date.descriptiveString(dateStyle: .medium))
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 120)
                .padding(.vertical, 4)
                .background(customColor.myColor)
                .cornerRadius(13)
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
    }
    
    func navBarLeadingBtn() -> some View {
        Button(action: {}) {
            HStack {
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(chat.person.name)
                    .bold()
            }
            .foregroundColor(.black)
        }
    }
    
    func navBarTrailingBtn() -> some View {
        HStack {
            Button(action: {}) {
            //    Image(systemName: "video")
            }
            
            Button(action: {}) {
            //    Image(systemName: "phone")
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chat: ChatsViewModel().chats[0])
        }
    }
}

