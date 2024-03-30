//
//  SubscriptionView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 17/9/23.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        
        VStack {
            Image("Top 1").padding(.top, 30)
            
            Image("Bottom 1")
            
            Text("Shifting Young Minds to Find Their Greatness")
              .font(
                Font.custom("Poppins", size: 32)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
              .frame(width: 295, height: 140, alignment: .center)
            
            Text("We are ready to empower and inspire young minds to reach their full potential!")
              .font(Font.custom("Poppins", size: 20))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.59))
              .frame(width: 256, alignment: .center)
            Spacer()
            
            Button {
                
            } label: {
                Text("Subscribe for 498 som/7 days")
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
            
            Image("Arrow - Right 2").padding(.top, 30)
        }                                .navigationBarBackButtonHidden(true)

    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
