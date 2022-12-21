//
//  ContentView.swift
//  FG
//
//  Created by Noura Sultan Ibn Qurmulah on 13/05/1444 AH.
//

import SwiftUI

struct profile: View {
    var body: some View {
      
        ZStack{
            Image("pink")
            ZStack{
                Image("Image")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    .padding(.bottom, 350.0)
                ZStack{
                    Image("SARA")
                        .resizable()
                        .scaledToFit()
                        .frame(width:120, height:120)
                        .clipShape(RoundedRectangle(cornerRadius: 90))
                        .padding(.bottom, 350.0)
                    VStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(width: 330, height: 250)
                        .padding(/*@START_MENU_TOKEN@*/.top, 300.0/*@END_MENU_TOKEN@*/)}
                    ZStack{
                        
                        Text("Name :           sara")
                            .padding(.top, 150.0)
                            .padding(.trailing, 155.0)
                        
                        Divider()
                            .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                            .padding(.top, 200.0)
                        Text("Age   :            30")
                            .padding(.trailing, 153.0)
                            .padding(.top, 250.0)
                        
                        Divider()
                            .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                            .padding(.top,300)
                        Text("Gender :         Famel")
                            .padding(.top, 350.0)
                            .padding(.trailing, 144.0)
                        Divider()
                            .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                            .padding(.top, 400.0)
                        
                        Text("Skin colour:") .padding(.top, 450.0)
                            .padding(.trailing, 198.0)
                        
                        Circle()
                            .fill(Color("3"))
                            .frame(width:30, height:30)
                            .padding(.top, 450.0)
                            .padding(.trailing, 36.0)
                        
                        
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundColor(.orange)
                        
                            .padding(.bottom, 709.0)
                            .padding(.leading, 275.0)
                    }
                      
                    
                    
                        
                }
                
            }
            
        }
                
                
            
           
           
      
        .padding()
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
    }
}

