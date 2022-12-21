
//
//  ContentView.swift
//  OnBoardingFG
//
//  Created by modi on 24/05/1444 AH.
//

import SwiftUI

struct OnBardingStep {
    let image: String
    let image1: String
    let title: String
    let description: String
    

    
}

private let onBoardingSteps = [
    OnBardingStep(image:"Image 3", image1: "Image 2", title: " ", description: " "),
    OnBardingStep(image:"Image 4", image1: "Image 2", title: "Our app help you to choose outfit that suit you ", description: ""),
    OnBardingStep(image:"Image 5", image1: "Image 2", title: "Contact with your guider ", description: "")

]


struct onboardingFGG: View {
    @State private var currentStep = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    
    var body: some View {
        
        
        ZStack {   Color("Color 2")
                .ignoresSafeArea()
            
            
            VStack {
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }) {
                        Text("Skip")
                            .padding(16)
                    }
                }
                
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSteps.count) { it in
                        
                        VStack {
                            ZStack {
                                Image(onBoardingSteps[it].image1)
                                    .resizable()
                                    .frame(width: 306, height: 178)
                                    .padding(.top, 180)
                                
                                Image(onBoardingSteps[it].image)
                                    .resizable()
                                    .frame(width: 263, height: 187)
                                
                            }
                            Text(onBoardingSteps[it].title)
                                .font(.title)
                                .multilineTextAlignment(.center)
                            
                            //  .bold()
                            
                            Text(onBoardingSteps[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                            
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack{
                    ForEach(0..<onBoardingSteps.count) {it in
                        
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height:  10)
                                .cornerRadius(10)
                                .foregroundColor(.orange)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                Button(action:{
                    if self.currentStep < onBoardingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        
                      
                    }
                     
                    
                }) {
                    Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get started")
                        .padding(16)
                        .frame(width: 310, height: 44)
                        .background(Color("Color 3"))
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                    
                }
                
            }
            .padding()
        }
    }
    
}

struct onboardingFGG_Previews: PreviewProvider {
    static var previews: some View {
        onboardingFGG()
    }
}
