//
//  ContentView.swift
//  ffg
//
//  Created by Noura Sultan Ibn Qurmulah on 24/05/1444 AH.
//

import SwiftUI


struct setting: View {
    @State var name = "sara"
    @State var email = "sara@gmail.com"
    @State var password = "********"
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
                                    .fill(Color("Color 3"))
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
                    VStack (alignment: .leading){
                        
                       
                        HStack {
                            Text("Name:")

                            Spacer()

                            TextField("", text: $name).foregroundColor(.gray)
                        }
//
                            .frame(width: 310, height: 35)
                            .background(Color.white)
                            
                        HStack {
                            Text("Email:")

                            Spacer()

                            TextField("", text: $email).foregroundColor(.gray)
                        }
                            
                                .frame(width: 310, height: 35)
                                .background(Color.white)
                            
                            
                        HStack {
                            Text("New password:")

                            Spacer()

                            TextField("", text: $password).foregroundColor(.gray)
                        }
                            
                                .frame(width: 310, height: 35)
                                .background(Color.white)
                    
                        NavigationLink{
                           BodyType()
                        }label: {
                            Text("Edit personal Info")
                        }.foregroundColor(Color("Color 3"))
                        
                        HStack{  Image(systemName: "phone.fill")
                                .foregroundColor(Color("Color 3"))
                              
                               
                            Text("Contact Us")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Color 3"))
                               
                            
                              
                                
                        } .padding(.top,20)
                        
                            
                        Button("Save Change") {
                           // isCancel12 = true
                        }
                        .foregroundColor(.black)
                        .frame(width: 310, height: 44)
                        .background(Color("Color 3"))
                        .cornerRadius(5)
                        .padding(.top, 55)
                    }.padding(.top, 150)
                 
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

