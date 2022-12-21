//
//  ContentView.swift
//  ffg
//
//  Created by Noura Sultan Ibn Qurmulah on 24/05/1444 AH.
//

import SwiftUI


struct setting: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    var body: some View {
        
        NavigationView {
            
            ZStack{ Image("pink")
               
                ZStack{
                
                     
                    
                    VStack {
                    
                    
                        ZStack{
                            Image("Image").resizable()
                                .frame(width: 300, height: 300)
                            VStack{
                                Image(uiImage: image ?? UIImage(named: "f")!)
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .clipShape(RoundedRectangle(cornerRadius: 200))
                                
                                
                                
                                ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.orange)
                                    .frame(width:180, height: 40)
                                
                                
                                    Button("Choose Picture") {
                                        self.showSheet = true
                                        
                                    }
                                    .foregroundColor(.white)
                                }}}
                    .padding()
                    
                    
                    .padding(.bottom, 400)
                    
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                                
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel()
                        ])
                    }
                    
                }
                    VStack{
                        TextField("Name", text: $name)
                            .padding()
                            .frame(width: 310, height: 35)
                            .background(Color.white)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .frame(width: 310, height: 35)
                            .background(Color.white)
                        
                        
                        TextField("Password:", text: $password
                        )
                        .padding()
                        .frame(width: 310, height: 35)
                        .background(Color.white)
                        
                    }
                }
                VStack{
                    
                    Button("Edit password") {
                     
                    }
                    .foregroundColor(.orange)
                    
                    .padding(.top, 193.0)
                }
                
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.orange)
                        .frame(width:180, height: 40)
                    Button("Edit personal info") {
                        
                    }
                    .foregroundColor(.white)
                }
                
                    .padding(.top, 337.0)
                    .padding(.leading, 1.0)
                HStack{  Image(systemName: "phone.fill")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding(.top, 499.0)
                        
                    Text("Contact")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 500.0)
                        .padding(.trailing, 220.0)
                }
                .navigationBarTitle("Settings")
                
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                }
                
                
            }
        }
    }
        struct setting_Previews: PreviewProvider {
            static var previews: some View {
                setting()
            }
        }
    }

