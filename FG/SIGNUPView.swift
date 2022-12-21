
//
//  SIGNUPView.swift
//  singup
//
//  Created by modi on 21/05/1444 AH.
//

import SwiftUI
import CloudKit

class CloudKituserMb: ObservableObject {
    @Published var text: String = ""
    @Published var pass: String = ""
    @Published var email: String = ""
    @Published var configpass: String = ""
    
    
 //   @State var profiles : String = ""
    
    func addButtonPressed() {
        guard !text.isEmpty else { return }
        addItem(name: text,password: pass, email: email )
    }
    private func addItem(name: String , password:String , email:String) {
        let newUser = CKRecord(recordType: "Profiles")
        newUser["name"] = name
        newUser["password"] = password
        newUser["email"] = email
        saveItem(record: newUser)
    }
    
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            
            DispatchQueue.main.async {
                self?.text = ""
                self?.pass = ""
                self?.email = ""
                
                
            }
          
        }
    }
}


struct SIGNUPView: View {
    @StateObject private var vm = CloudKituserMb()
    @State  var username = ""
    @State  var email = ""
    @State  var password = ""
    @State  var confirmPassword = ""
    @State  var wrongEmail = 0
    @State  var wrongPassword = 0
    @State  var showingLonginScreen: Bool = false

    
    var body: some View {
     //  NavigationView{


        ZStack {
            Image("Image 1")
                .ignoresSafeArea()
            
            ZStack {
                Image("Image 2")
                    .resizable()
                    .frame(width: 306, height: 248)
                    .padding(.bottom, 330)
                
                
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.bottom, 330)
                
            }
            
            
            
            
                VStack {
                    
                    
                    
                    VStack {
                        textField
                        textField3
                        textField2
                        textFieldconfirmpass
                        
                    }
                    VStack{
                        
                        addButton
                        haveAccount
                    }
                    .padding(.top, 40)
                }
                .padding(.top, 250)
                
                
          // }
        }
            
        
   
                
        
            }
        }
    
    

struct SIGNUPView_Previews: PreviewProvider {
    static var previews: some View {
        SIGNUPView()
    }
}



extension SIGNUPView {
    
    private var textField: some View {
        
        TextField("Name", text: $vm.text)
        
            .padding()
            .frame(width: 310, height: 35)
            .background(Color.white)
        
        //    .padding()
        
        
    }
    
    private var textField2: some View {
        
        TextField("password", text: $vm.pass)
            .padding()
            .frame(width: 310, height: 35)
            .background(Color.white)
        
        //    .padding()
        
        
    }
    private var textField3: some View {
        
        TextField("Email", text: $vm.email)
            .padding()
            .frame(width: 310, height: 35)
            .background(Color.white)
        
            .padding()
        
        
    }
    
    
    private var textFieldconfirmpass: some View {
        
        TextField("Confirm Password", text: $vm.configpass)
            .padding()
            .frame(width: 310, height: 35)
            .background(Color.white)
        
            .padding()
    }
    
    
    private var addButton: some View {
        
        Button("Sign Up") {
            vm.addButtonPressed()
        }
        .foregroundColor(.white)
        .frame(width: 310, height: 44)
        .background(Color("Color 3"))
        .cornerRadius(5)
    }
    
    private var haveAccount: some View {
        
        Button {
            showingLonginScreen = true
        } label: {
            Text("ALREADY HAVE ACCOUNT? LOG IN")
            //  .fontWeight(.thin)
                .foregroundColor(Color("Color 1"))
            //   .padding(.top, 580)
            
        }
        .fullScreenCover(isPresented: $showingLonginScreen) {
         LoginView()
        }
            //            NavigationLink( destination: ContentView(),
            //                            label:  { Text("ALREADY HAVE ACCOUNT? LOG IN")
            //                           //  .fontWeight(.thin)
            //                               .foregroundColor(Color("Color 1"))
            //                           //    .padding(.top, 580))
            //        })
        }
    
    
}

