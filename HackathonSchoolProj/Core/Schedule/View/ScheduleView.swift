//
//  ScheduleView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 17/9/23.
//

import SwiftUI

struct ScheduleView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Icon")
                            .frame(width: 30, height: 30)
                    }.padding(.leading, 20)
                        .padding(.bottom, 31)
                    .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                
                
                Spacer()
                
                Text("Schedule")
                    .font(
                        Font.custom("Poppins", size: 18)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.06, green: 0.06, blue: 0.06)).padding(.trailing, 30)
                
                Spacer()
            }.padding(.top, 20)
            
            
            Image("🎛 Calendar Month (Variants)").padding(.top, 30)
            
            HStack  {
                VStack (alignment: .leading) {
                    // Bold/Type@14
                    Text("4:30pm - 5:00pm")
                        .font(
                            Font.custom("Manrope", size: 14)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.1, green: 0.11, blue: 0.12))
                    
                    // Medium/Type@12
                    Text("Google Meet")
                        .font(
                            Font.custom("Manrope", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.67, green: 0.71, blue: 0.73))
                }.padding(.leading, 16)
                
                Spacer()
                
                Image("Active 1").padding(.trailing, 16)
            }
            
            .frame(width: 327, height: 73)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 327, height: 73)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            ) .padding(.top, 10)
            
            HStack  {
                VStack (alignment: .leading) {
                    // Bold/Type@14
                    Text("5:30pm - 6:00pm")
                        .font(
                            Font.custom("Manrope", size: 14)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.1, green: 0.11, blue: 0.12))
                    
                    // Medium/Type@12
                    Text("Google Meet")
                        .font(
                            Font.custom("Manrope", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.67, green: 0.71, blue: 0.73))
                }.padding(.leading, 16)
                
                Spacer()
                
                Image("Active").padding(.trailing, 16)
            }
            .frame(width: 327, height: 73)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 327, height: 73)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            ) .padding(.top, 10)
            
            HStack  {
                VStack (alignment: .leading) {
                    // Bold/Type@14
                    Text("6:20pm - 6:50pm")
                        .font(
                            Font.custom("Manrope", size: 14)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.1, green: 0.11, blue: 0.12))
                    
                    // Medium/Type@12
                    Text("Google Meet")
                        .font(
                            Font.custom("Manrope", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.67, green: 0.71, blue: 0.73))
                }.padding(.leading, 16)
                
                Spacer()
                
                Image("Active").padding(.trailing, 16)
            }
            .frame(width: 327, height: 73)
            
            .background(
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 327, height: 73)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            ) .padding(.top, 10)
            
            
            Button {
                
            } label: {
                Text("Book For $5")
                    .font(
                        Font.custom("Poppins", size: 16)
                            .weight(.medium)
                    )
                    .frame(width: 327, height: 50)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("BlueForFont"))
                        
                        
                    )
            }
            .background(
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 100)
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            ) .padding(.top, 40).ignoresSafeArea()
            
        }.navigationBarBackButtonHidden(true)
        
     
        
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
