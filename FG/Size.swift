//
//  Size.swift
//  FG
//
//  Created by alaa.alsulaiman on 20/05/1444 AH.
//

import SwiftUI

struct Size: View {
   
    
    @Binding var selection1: String
    
    
    var body: some View {
        
        
        
        let swatchess = [
            "xs","s","m","Lr","xl","xxl"]
        
        
        let columnss = [
            GridItem(.adaptive(minimum: 45))
        ]

        LazyVGrid(columns: columnss ,spacing: 10) {
            ForEach(swatchess, id: \.self){ swatchs in
                ZStack(alignment: .center) {
                    
                        Image(swatchs)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .onTapGesture(perform: {
                            selection1 = swatchs
                        })
                        .padding()

                    if selection1 == swatchs {
                      
                     
                            
                            (Image(swatchs))
                            .resizable()
                            .frame(width: 42, height: 42)
                            .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.orange, lineWidth: 2))
                                    
                        
                        //Image(systemName: "checkmark")
                    }
                }
            }
        }
        .padding(10)
    }
}

struct Size_Previews: PreviewProvider {
    static var previews: some View {
        Size(selection1: .constant("swatchs_shipcove"))
    }
}
