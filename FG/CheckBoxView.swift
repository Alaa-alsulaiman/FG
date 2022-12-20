//
//  CheckBoxView.swift
//  FG
//
//  Created by alaa.alsulaiman on 19/05/1444 AH.
//

/*import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.circle" : "circle")
            .foregroundColor(checked ? Color(.orange) : Color.black)
            .onTapGesture {
                self.checked.toggle()
            }
    
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}*/
import SwiftUI


//MARK:- Single Radio Button Field
struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment:.center)
            {

                
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                    .frame(width: self.size, height: self.size)
                
                    .foregroundColor(.orange)
                    
               
                Text(label)
                    .font(Font.system(size: textSize))
               
                Spacer()
            }.foregroundColor(self.color)
                
        }
        .foregroundColor(Color.white)
        
    }
}
enum Gender: String {
    case male = ""
    case female = " "
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        HStack{
            radioMaleMajority
            radioFemaleMajority
        }
        
        //.position(x:280,y:10)
    }
    
    var radioMaleMajority: some View {
        RadioButtonField(
            id: Gender.male.rawValue,
            label: Gender.male.rawValue,
            isMarked: selectedId == Gender.male.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioFemaleMajority: some View {
        RadioButtonField(
            id: Gender.female.rawValue,
            label: Gender.female.rawValue,
            isMarked: selectedId == Gender.female.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
