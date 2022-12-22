//
//  ContentView.swift
//  project 2
//
//  Created by lama aldosari on 13/05/1444 AH.
//

import SwiftUI


struct Box1: Hashable {

let imageURL : String
}

struct HomePage2: View {
    
    struct customColor{
        static let myColor = Color("movC")
        static let myColor1 = Color("pinkC")
        static let myColor2 = Color("orangeC")
        
    }
    @State private var searchText = ""
    
    let boxes : [Box1] = [
    Box1(imageURL: "logo"),
    Box1(imageURL: "logo"),
    Box1(imageURL: "logo"),
    Box1(imageURL: "logo"),
    Box1(imageURL: "logo")
    ]
    
    var body: some View{
 
    

        
        NavigationView{
            
            

            
            VStack {
                
                
            
                
                
                
                ScrollView(.horizontal, showsIndicators: false ){
                    HStack(spacing : -220 ){
                        ForEach(boxes, id: \.self) { box in
                            GeometryReader { geometry in
                                
                                Button(action: {}, label: {
                                    (Image(box.imageURL))//image
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX)  / -9), axis: (x:0, y: 30.0, z: 0))
                                    
                                })//action
                                
                            }//geomatryreader
                            
                        }.frame(width: 390, height: 160)
                        
                        
                    } .padding(.all)
                }
                
                
                
                ///
                
                List{
                    VStack (alignment: .leading){
                        HStack{   Image("Adam Smith")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                                .cornerRadius(5)
                            
                            VStack{   Text("Adam Smith")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Text("★★★★")}
                     
                            NavigationLink{
                                tabs4()
                            }label: {
                        
                                Text("more")
                            }.foregroundColor(Color.white)
                            .frame(width: 71.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/24.0)
                          
                            .padding(.leading, 59.0)
                            //   .padding(.top, 37.0)
                        }
                    }.listRowBackground(customColor.myColor)
                    VStack (alignment: .leading){
                        HStack{ Image("Zac Clark")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                                .cornerRadius(5)
                            
                            
                            VStack{     Text("Zac Clark")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Text("★★★★")}
                            NavigationLink{
                                tabs2()
                            }label: {
                        
                                Text("more")
                            }.foregroundColor(Color.white)
                            .frame(width: 71.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/24.0)
                          
                            .padding(.leading, 86.0)
                            
                        }
                    }.listRowBackground(customColor.myColor)
                    VStack (alignment: .leading){
                        HStack{   Image("Emma Wilson")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                                .cornerRadius(5)
                            VStack{   Text("Emma Wilson")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Text("★★★★")}
                            
                            NavigationLink{
                                tabs()
                            }label: {
                        
                                Text("more")
                            }.foregroundColor(Color.white)
                            .frame(width: 71.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/24.0)
                          
                            .padding(.leading, 86)
                            
                        }
                    }.listRowBackground(customColor.myColor)
                    
                    VStack (alignment: .leading){
                        HStack{   Image("Sofie Gracia")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                                .cornerRadius(5)
                            VStack{   Text("Sofie Gracia")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Text("★★★★")}
                            NavigationLink{
                                tabs3()
                            }label: {
                        
                                Text("more")
                            }.foregroundColor(Color.white)
                            .frame(width: 71.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/24.0)
                          
                            .padding(.leading, 86.0)
                            
                        }
                    }.listRowBackground(customColor.myColor)
                    VStack (alignment: .leading){
                        HStack{    Image("Lucas Lee")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                                .cornerRadius(5)
                            VStack{     Text("Lucas Lee")
                                    .fontWeight(.semibold)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                Text("★★★")}
                        }
                    }.listRowBackground(customColor.myColor)
                }.listStyle(.sidebar)
                
                    .navigationTitle("Our Guiders")
                    .searchable(text: $searchText)
                
                
            } .background(customColor.myColor1)
            
        }
    
        .background(.white)
        .scrollContentBackground(.hidden)
        }
    }
    struct HomePage2_Previews: PreviewProvider {
        static var previews: some View {
            HomePage2()
        }
    }






