//
//  tabs2.swift
//  FG
//
//  Created by alaa.alsulaiman on 26/05/1444 AH.
//

import SwiftUI

struct tabs2: View {
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .init(named: "Ora")
    }
    
    
    @State private var outfits = 0
    @State var selection2: String = "swatchss_shipcove"
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient (colors: [.init("Pink"),.white]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack(alignment:.leading){
                
                HStack{
                    Image("P2")
                        .resizable()
                        .frame(width:150, height:150)
                        .cornerRadius(17)
                    Text("Zac Clark ")
                    .font(.title.bold())}
                    VStack{
                        Text("Designer")
                            .font(.title3)
                        .foregroundColor(.gray)}
                    .offset(x:160,y:-60)
                
                
                VStack{
                    Picker("Outfits?", selection: $outfits, content: { Text("info").fontWeight(.semibold).tag(0)
                        Text("OutFits").fontWeight(.semibold).tag(1)}
                    )
                    .pickerStyle(.segmented)
                    .frame(width: 360,height: 35)
                    .background(Color.init("Mofi"))
                    .cornerRadius(10)
                    
                    if outfits == 0 { VStack{
                        
                        Text("I have a great passion for fashion.  I worked as a Designer for several brands. I studied fashion at Sam's Institute Worked in Zara as stylist.")
                        
                        
                        
                        
                    }}
                    Spacer()
                        
                        if outfits == 1 {
                            VStack(alignment:.leading){
                                Text("Some of the guider outfits:")
                            Guider(selection2:$selection2)
                            
                        }}
                    
                    
                }
                
            }.padding(.horizontal,20)
        }
        
    }
}
struct tabs2_Previews: PreviewProvider {
    static var previews: some View {
        tabs2()
    }
}
