//
//  ContentView.swift
//  FG
//
//  Created by alaa.alsulaiman on 17/05/1444 AH.
//

import SwiftUI


struct BodyType: View {
    @State private var birthDate = Date()
    @State var selection: String = "swatch_shipcove"
    @State var selection1: String = "swatchs_shipcove"
   // @State private var
   
    var body: some View {
      
        ZStack {
            LinearGradient(gradient: Gradient (colors: [.init("Pink"),.white]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            
            VStack(alignment:.leading){
               HStack{
                    Image("mf")
                        .resizable()
                        .frame(width:30, height:30)
                    Text("Gender")
               }
                //1
                HStack(spacing: (55)){
                    VStack{
                        VStack(alignment: .center){
                            Image("man")
                                .resizable()
                                .frame(width:80, height:80)
                                .padding(10)
                                .aspectRatio(contentMode: .fit)
                            Text("Male")
                                .font(.title2)
                            
                        } .frame(width: 100, height: 150)
                            .background(Color.init("Mofi"))
                            .cornerRadius(17)
                            .padding()
                        
                        
                    }
                    .offset(x:20)
                    
                    //
                    VStack{
                        VStack(alignment: .center){
                            Image("Woman")
                                .resizable()
                                .frame(width:80, height:80)
                                .padding(10)
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Female")
                                .font(.title2)
                        } .frame(width: 100, height: 150)
                            .background(Color.init("Mofi"))
                            .cornerRadius(17)
                            .padding()
                        
                        //CheckBoxView(checked: $checked11)
                       
                        
                    }
                    .offset(x:10)
                }
                VStack {
                    RadioButtonGroups { selected in
                        print("Selected Gender is: \(selected)")
                          
                    }  .offset(x:80)
                   
                }
               
                
                // close hstack
                    
                HStack{
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width:20, height:20)
                    Text("Age")}
                
                
                    VStack{
                        DatePicker("", selection: $birthDate, in:...Date(), displayedComponents: .date)
                            
                            .labelsHidden()
                            .position(x: 75 , y: 25)
                        
                    }.font(.title2)
                    .frame(width: 350, height: 50)
                    .background(Color.init("Mofi"))
                    .cornerRadius(17)
                   
                HStack{
                    
                    Image(systemName: "circle.hexagonpath.fill")
                        .resizable()
                        .frame(width:20, height:20)
                    Text("Skin color")}
                VStack {
                    Skincolor(selection: $selection)

                       } .frame(width: 350, height: 60)
                    .background(Color.init("Mofi"))
                    .cornerRadius(17)
                
                
                
                HStack{
                    
                    Image(systemName: "tshirt")
                        .resizable()
                        .frame(width:20, height:20)
                    Text("Size")}
                
                VStack {
                    Size(selection1: $selection1)

                       } .frame(width: 350, height: 60)
                    .background(Color.init("Mofi"))
                    .cornerRadius(17)
                
            } .padding(.horizontal,40)
        }//z background
        
        
    }
}

struct BodyType_Previews: PreviewProvider {
    static var previews: some View {
        BodyType()
    }
}
