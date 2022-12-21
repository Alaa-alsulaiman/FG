//
//  ContentView.swift
//  singup
//
//  Created by modi on 13/05/1444 AH.
//

import SwiftUI

struct LoginView: View {
    

    @State  var email = ""
    @State  var password = ""
    @State  var wrongEmail = 0
    @State  var wrongPassword = 0
    @State  var showingLonginScreen = false
    
    var body: some View {
   
     
        
    //   NavigationView {
       
            ZStack {
                Image("Image 1")
                    .ignoresSafeArea()
                    
             
          
                ZStack {
                    Image("Image 2")
                        .resizable()
                        .frame(width: 306, height: 248)
                        .padding(.bottom, 330)
                    
                    
                    Text("WELCOME BACK")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding(.bottom, 330)
                    
                }
                
                
               Spacer()
                
                    VStack {
                        
                    TextField("Email", text: $email)
                            .padding()
                        .frame(width: 310, height: 35)
                        .background(Color.white)
                        .border(.red, width:CGFloat(wrongEmail))
                    
                        
                        .padding()
                    SecureField("Password", text: $password)
                            .padding()
                        .frame(width: 310, height: 35)
                        .background(Color.white)
                      //  .cornerRadius(10)
                        .border(.red, width:CGFloat(wrongPassword))
                        
                        Button(action:{ }) {
                            Text("FORGET PASSWORD?")
                                .fontWeight(.thin)
                                .foregroundColor(Color("Color 1"))
                                .padding(.leading, 150)
                                
                                
                        }
                        
                    Button("Login") {
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 310, height: 44)
                    .background(Color("Color 3"))
                    .cornerRadius(5)
                    .padding(.top, 55)
                        
                        
//
//                        NavigationLink(destination: SIGNUPView()) {
//
//                            Text("SIGN UP")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color("Color 1"))
//                        }
                        
                        Button("SIGN UP") {
              showingLonginScreen = true

                        }
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color 1"))
                        .fullScreenCover(isPresented: $showingLonginScreen) {
                           // SIGNUPView()
                        }
                }
                
                
                    .padding(.top, 220)
            }
            
     //  }
     //   .navigationBarHidden(true)
        
        
        
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

