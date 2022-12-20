//
//  Guider.swift
//  FG
//
//  Created by alaa.alsulaiman on 21/05/1444 AH.
//

import SwiftUI

struct OutFits: Hashable {
   
    var image: String
}
    

struct Guider: View {
    
    @Binding var selection2: String
    
    var Guider: [OutFits] = [OutFits(image: "Out1"),
                             OutFits(image: "Out2"),
                             OutFits(image: "Out3"),
                             OutFits(image: "Out4"),
                             OutFits(image: "Out5"),
                             OutFits(image: "Out6")]
    
    
    var body: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
        
        ZStack {
            LinearGradient(gradient: Gradient (colors: [.init("Pink"),.white]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            
            
                
                ScrollView{
                    
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(Guider, id: \.self) { outfit in
                            
                            
                            ZStack{
                                
                                Image(outfit.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .frame(width: 200, height: 200)
                                
                                
                            }
                        }
                    }
                }
                
            }
        }
    }




struct Guider_Previews: PreviewProvider {
    static var previews: some View {
        Guider(selection2: .constant("swatchss_shipcove"))
    }
}
