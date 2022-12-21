//
//  ContentView.swift
//  password
//
//  Created by Noura Sultan Ibn Qurmulah on 26/05/1444 AH.
//

import SwiftUI


struct Editpassword: View {
    @State var password = ""
    @State var newpassword = ""
    @State var confirmnewpassword = ""
    var body: some View {
        
        ZStack{
            
            Image("pink")
            ZStack{
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                VStack {
                    TextField("Password:", text: $password
                    )
                    .padding()
                    .frame(width: 310, height: 35)
                    .background(Color.white)
                    
                    TextField("New Password:", text: $newpassword
                    )
                    .padding()
                    .frame(width: 310, height: 35)
                    .background(Color.white)
                    
                    TextField("Confirm New Password:", text: $newpassword
                    )
                    .padding()
                    .frame(width: 310, height: 35)
                    .background(Color.white)
                    
                    
                }}
            .padding(.bottom, 200.0)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.orange)
                        .frame(width:150, height: 40)
                    
                        .padding(/*@START_MENU_TOKEN@*/.top, 300.0/*@END_MENU_TOKEN@*/)
                    
                    
                    Button("Save") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                        .foregroundColor(.white)
                        
                        .padding(.top, 300.0)
                }  }
            .padding(.bottom, 42.0)
            
            
        }
        
    }
    
    
    struct Editpassword_Previews: PreviewProvider {
        static var previews: some View {
            Editpassword()
        }
    }     }

