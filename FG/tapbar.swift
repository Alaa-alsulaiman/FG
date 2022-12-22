//
//  tapbar.swift
//  FG
//
//  Created by yara mohammed alqahtani on 27/05/1444 AH.
//

import SwiftUI

struct tapbar: View {
    struct customColor{
        static let myColor = Color("movC")
        static let myColor1 = Color("pinkC")
        static let myColor2 = Color("orangeC")
        
    }
    var body: some View {
        TabView{
            HomePage2()
            . tabItem {
            Image (systemName:"person.2.wave.2.fill")
            Text ("Guider" )
            }
            
            
            ContentView()
            . tabItem {
            Image (systemName: "ellipsis.message.fill")
            Text ("Message" )
            }

            
            setting()
            . tabItem {
            Image (systemName: "setting.fill")
            Text ("Settong" )
            }
            
        }.accentColor(customColor.myColor2)
}

struct tapbar_Previews: PreviewProvider {
    static var previews: some View {
        
            
        tapbar()
            
        }
    }
}
