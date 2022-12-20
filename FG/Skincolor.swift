//
//  Skincolor.swift
//  FG
//
//  Created by alaa.alsulaiman on 20/05/1444 AH.
//

import SwiftUI

struct Skincolor: View {

    @Binding var selection: String

    var body: some View {

        let swatches = [
            "Black","Dark","Med","Light","White"
        ]

        let columns = [
            GridItem(.adaptive(minimum: 57))
        ]

        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(swatches, id: \.self){ swatch in
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color(swatch))
                        .frame(width: 40, height: 40)
                        .onTapGesture(perform: {
                            selection = swatch
                        })
                        .padding(10)

                    if selection == swatch {
                        Circle()
                            .stroke(Color(swatch), lineWidth: 5)
                            .frame(width: 50, height: 50)
                        Image(systemName: "checkmark")
                            
                    }
                }
            }
        }
        .padding(10)
    }
}

struct Skincolor_Previews: PreviewProvider {
    static var previews: some View {
        Skincolor(selection: .constant("swatch_shipcove"))
    }
}
